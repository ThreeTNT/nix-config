{ username, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland = {
    enable = true;
  };
}
