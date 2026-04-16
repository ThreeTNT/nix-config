#!/usr/bin/env bash

handle_firefox_extension_window() {
    is_floating=$(hyprctl clients -j | jq -r --arg addr "$window_address" '.[] | select(.address==$addr) | .floating')
    if [ "$is_floating" != "true" ]; then
        command_arg=$(printf 'dispatch setfloating address:%s; dispatch resizewindowpixel exact 800 800,address:%s; dispatch focuswindow address:%s; dispatch centerwindow' "$1" "$1" "$1")
        hyprctl --quiet --batch "$command_arg";
    fi
}

handle_firefox_title_change() {
    case $2 in
        'Extension:'*'— Mozilla Firefox') handle_firefox_extension_window "$1" "$2";
    esac
}

handle_title_change() {
    window_data=$(printf "%s" "$1" | awk -F'>>' '{print $2}');
    window_address=$(printf "0x%s" "$window_data" | awk -F',' '{print $1}')
    window_title=$(printf "%s" "$window_data" | awk -F',' '{print $2}');
    window_initial_class=$(hyprctl clients -j | jq -r --arg addr "$window_address" '.[] | select(.address==$addr) | .initialClass');

    case $window_initial_class in
        firefox) handle_firefox_title_change "$window_address" "$window_title";
    esac
}

handle() {
  case "$1" in
    windowtitlev2*) handle_title_change "$1";
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done