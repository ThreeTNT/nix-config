{
  home-manager.users.lena.wayland.windowManager.hyprland.enable = true;

  imports = [
    ./general.nix
    ./rules.nix
    ./binds.nix
  ];
}
