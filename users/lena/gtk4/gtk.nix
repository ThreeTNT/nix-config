{
  pkgs,
  username,
  host-config,
  ...
}:
let
  theme = pkgs.callPackage ../packages/catppuccin-gtk.nix {
    flavor = "macchiato";
    accent = "mauve";
  };
in
{
  home-manager.users.${username} = {
    gtk = {
      enable = host-config.gui;
      colorScheme = "dark";
      gtk4.theme = {
        name = "catppuccin-macchiato-mauve-standard";
        package = theme;
      };
    };
  };
}
