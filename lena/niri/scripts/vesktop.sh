#!/usr/bin/env bash
#
# Hyprland version listened on the compositor socket for `openwindow` events
# and silently shoved Vesktop into the `special` workspace. niri has no
# special/scratchpad workspace, so this instead silently moves each new
# Vesktop window to a plain named workspace called "vesktop", without
# stealing focus (--focus false), every time one opens.
#
# Note: rules.nix already declares an `open-on-workspace = "vesktop"`
# window-rule for the same app-id, which covers the common case (including
# windows opened at niri startup) without needing this script at all. Keep
# this script only if you want it to also catch windows that change their
# app-id/title after opening, or if you're on a niri version where
# open-on-workspace doesn't reliably match Vesktop.

handle() {
  local id
  id=$(jq -r '
    select(has("WindowOpenedOrChanged")) |
    .WindowOpenedOrChanged.window |
    select((.app_id // "") | test("^(vesktop|discord)$")) |
    .id
  ')

  [ -n "$id" ] || return 0

  niri msg action move-window-to-workspace "vesktop" --id "$id" --focus false
}

niri msg -j event-stream | while read -r line; do
  echo "$line" | handle
done
