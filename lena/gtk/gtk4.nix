{
  pkgs,
  lib,
  host-config,
  config,
  ...
}:
let
  flavor = config.home-manager.users.lena.catppuccin.flavor;
  accent = config.home-manager.users.lena.catppuccin.accent;
  theme = pkgs.callPackage ../../packages/catppuccin-gtk.nix {
    flavor = flavor;
    accent = accent;
  };
in
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  home-manager.users.lena = {
    gtk = {
      enable = host-config.gui;
      colorScheme = if flavor == "latte" then "light" else "dark";
      theme = {
        name = "catppuccin-${flavor}-${accent}-standard";
        package = theme;
      };
      gtk4.theme = {
        name = "catppuccin-${flavor}-${accent}-standard";
        package = theme;
      };
    };
  };
}
