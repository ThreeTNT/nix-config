{ pkgs, username, ... }:
let
  theme = pkgs.callPackage ../packages/catppuccin-gtk.nix { 
    flavor = "macchiato";
    accent = "mauve";
  };
in
{
  home-manager.users.${username} = {
    gtk = {
      enable = true;
      colorScheme = "dark";
      theme.name = "catppuccin-macchiato-mauve-standard";
      theme.package = theme;
    };
  };
}