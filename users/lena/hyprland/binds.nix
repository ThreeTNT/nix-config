{ username, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    
    bind = [
      "$mod, T, exec, kitty"
      "$mod, E, exec, firefox"

      "$mod, Q, killactive"

      "$mod CTRL, left, workspace, r-1"
      "$mod CTRL, right, workspace, r+1"
      "$mod CTRL ALT, left, movetoworkspace, r-1"
      "$mod CTRL ALT, right, movetoworkspace, r+1"
    ];

    binds = { drag_threshold = 10; };
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod, Z, movewindow"
      "$mod, X, resizewindow"
    ];
  };
}