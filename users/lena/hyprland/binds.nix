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
      "$mod CTRL SHIFT, left, movetoworkspace, r-1"
      "$mod CTRL SHIFT, right, movetoworkspace, r+1"
    ];
  };
}