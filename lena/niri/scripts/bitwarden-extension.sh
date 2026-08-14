#!/usr/bin/env bash
#
# Hyprland version watched `windowtitlev2` events on the compositor socket,
# looked up the window's class via `hyprctl clients`, and floated+centered+
# resized the Bitwarden Firefox extension popup once its title changed away
# from the generic "Mozilla Firefox" placeholder.
#
# niri's event-stream reports app_id/title/is_floating directly on each
# WindowOpenedOrChanged event, so there's no need for a separate
# `niri msg windows` lookup. We track window ids we've already floated so
# a window isn't re-floated/re-centered every time its title changes again.

declare -A handled

handle_line() {
  local line="$1"
  local id app_id title is_floating

  IFS=$'\t' read -r id app_id title is_floating < <(
    jq -r '
      if has("WindowOpenedOrChanged") then
        .WindowOpenedOrChanged.window
        | [(.id // empty), (.app_id // empty), (.title // empty), (.is_floating // empty)]
        | @tsv
      else
        empty
      end
    ' <<< "$line"
  )

  [ -n "$id" ] || return 0
  [ "$app_id" = "firefox" ] || return 0
  [[ "$title" == Extension:*"— Mozilla Firefox" ]] || return 0
  [ -z "${handled[$id]}" ] || return 0
  [ "$is_floating" = "true" ] && return 0

  echo "meow"

  handled[$id]=1
  niri msg action focus-window --id "$id"
  niri msg action focus-floating
  niri msg action set-window-width --id "$id" "800"
  niri msg action set-window-height --id "$id" "800"
  niri msg action center-window
}

niri msg -j event-stream | while read -r line; do
  echo "$line" | handle_line
done
