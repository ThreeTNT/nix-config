{ config, ... }:
{
  # Note: the `pics` directory Hyprland passed to hyprshot's `-o` flag is now
  # set once, globally, via `screenshot-path` in general.nix instead of per
  # keybind -- niri's own screenshot action always saves there.
  home-manager.users.lena.programs.niri.settings = {
    binds = with config.home-manager.users.lena.lib.niri.actions; {
      "Mod+T".action = spawn "kitty";
      "Mod+E".action = spawn "firefox";
      "Mod+V".action = spawn "vesktop";
      "Mod+C".action = spawn "code";

      "Mod+P".action = spawn "niri" "msg" "action" "screenshot";
      "Mod+Tab".action = spawn "dms" "shell" "drawers" "toggle" "launcher";

      "Mod+Q".action = close-window;
      "Mod+F".action = toggle-window-floating;

      # niri has no true special/scratchpad workspace. This uses a plain
      # named workspace called "scratch" as the closest approximation: it
      # will not float above everything like Hyprland's special workspace
      # does — focusing it just switches you to that workspace instead.
      "Mod+S".action = focus-workspace "scratch";
      "Mod+Shift+S".action = spawn "niri" "msg" "action" "move-column-to-workspace" "scratch";

      # === Navigations ===
      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action = focus-workspace-down;
      };
      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action = focus-workspace-up;
      };
      "Mod+WheelScrollDown".action = focus-column-right;
      "Mod+WheelScrollUp".action = focus-column-left;

      "Mod+Ctrl+Up".action = focus-workspace-up;
      "Mod+Ctrl+Down".action = focus-workspace-down;
      "Mod+Ctrl+Alt+Left".action = move-column-to-workspace-up;
      "Mod+Ctrl+Alt+Right".action = move-column-to-workspace-down;

      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      # ===================

      # === Focus workspaces ===
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      # ========================

      # Hyprland's movefocus works in all 4 directions across the whole
      # tiled layout. niri splits this: up/down move focus within a column,
      # left/right move focus between columns.

      "Mod+F11".action = fullscreen-window;
      "Mod+F10".action = maximize-column;

      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = spawn "pwctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = spawn "pwctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "2%-";
      };
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = spawn "pwctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "2%+";
      };
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action = spawn "playerctl" "play-pause";
      };
      "XF86AudioPause" = {
        allow-when-locked = true;
        action = spawn "playerctl" "play-pause";
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action = spawn "playerctl" "next";
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action = spawn "playerctl" "previous";
      };
    };
  };
}
