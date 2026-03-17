{ username, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
    general = {
      "col.active_border" = "rgba(f0c6c6e6) rgba(c6a0f6e6) 45deg";
      "col.inactive_border" = "rgba(24273a96)";
    };

    misc = {
      background_color = "rgba(1D1011FF)";
    };
  };
}
