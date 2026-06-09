{ config, ... }:
let
  pics = config.home-manager.users.lena.xdg.userDirs.pictures;
in
{
  home-manager.users.lena.wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, T, exec, kitty"
      "$mod, E, exec, firefox"
      "$mod, V, exec, vesktop"
      "$mod, C, exec, code"
      "$mod, P, exec, hyprshot -m region -o ${pics}"

      "$mod, TAB, exec, caelestia shell drawers toggle launcher"

      "$mod, Q, killactive"
      "$mod, F, togglefloating"

      "$mod, S, togglespecialworkspace"
      "$mod SHIFT, S, movetoworkspace, special"

      "$mod CTRL, left, workspace, r-1"
      "$mod CTRL, right, workspace, r+1"
      "$mod CTRL ALT, left, movetoworkspace, r-1"
      "$mod CTRL ALT, right, movetoworkspace, r+1"

      "$mod, 1, exec, hyprctl dispatch workspace 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 10, workspace, 10"

      "$mod, UP, movefocus, u"
      "$mod, DOWN, movefocus, d"
      "$mod, LEFT, movefocus, l"
      "$mod, RIGHT, movefocus, r"

      "$mod, F11, fullscreen"
      "$mod, F10, fullscreen, 1"
    ];

    bindl = [
      # bindl allows execution in lock screens, etc.
      ", XF86AudioMicMute, exec, pwctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86AudioLowerVolume, exec, pwctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioRaiseVolume, exec, pwctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    binds = {
      # idk what binds do
      drag_threshold = 10;
    };
    bindm = [
      # bindm allows mouse binding
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, Z, movewindow"
      "$mod, X, resizewindow"
    ];
  };
}
