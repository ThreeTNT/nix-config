#!/usr/bin/env bash

handle() {
  local id
  id=$(jq -r '
    select(has("WindowOpenedOrChanged")) |
    .WindowOpenedOrChanged.window |
    select((.app_id // "") | test("^(vesktop|discord)$")) |
    .id
  ')

  [ -n "$id" ] || return 0

  niri msg action move-window-to-workspace "scratch" --id "$id" --focus false
}

niri msg -j event-stream | while read -r line; do
  echo "$line" | handle
done
