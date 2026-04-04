{ username, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, T, exec, kitty"
      "$mod, E, exec, firefox"
      "$mod, B, exec, vesktop"
      "$mod, C, exec, codium"

      "$mod, TAB, exec, caelestia shell drawers toggle launcher"

      "$mod, Q, killactive"
      "$mod, F, togglefloating"

      "$mod CTRL, left, workspace, r-1"
      "$mod CTRL, right, workspace, r+1"
      "$mod CTRL ALT, left, movetoworkspace, r-1"
      "$mod CTRL ALT, right, movetoworkspace, r+1"
    ];

    bindl = [
      # l allows execution in lock screens, etc.
      ", XF86AudioMicMute, exec, pwctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86AudioLowerVolume, exec, pwctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioRaiseVolume, exec, pwctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    binds = {
      drag_threshold = 10;
    };
    bindm = [
      # m allows mouse binding
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, Z, movewindow"
      "$mod, X, resizewindow"
    ];
  };
}
