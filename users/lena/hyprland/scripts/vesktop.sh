#!/usr/bin/env bash

handle() {
  case $1 in
    openwindow*)
      local data=${1#*>>}
      local class_title=$(echo $data | awk -F',' '{print $3, $4}')
      
      if [[ "$class_title" == "vesktop Discord" || "$class_title" == "vesktop vesktop" ]]; then
        hyprctl dispatch movetoworkspacesilent special,class:vesktop
      fi
      ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done