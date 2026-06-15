{
  pkgs,
  username,
  host-config,
  config,
  ...
}:
let
  flavor = config.home-manager.users.${username}.catppuccin.flavor;
  accent = config.home-manager.users.${username}.catppuccin.accent;
  theme = pkgs.callPackage ../packages/catppuccin-gtk.nix {
    flavor = flavor;
    accent = accent;
  };
in
{
  home-manager.users.${username} = {
    gtk = {
      enable = host-config.gui;
      colorScheme = if flavor == "latte" then "dark" else "light";
      gtk4.theme = {
        name = "catppuccin-${flavor}-${accent}-standard";
        package = theme;
      };
    };
  };
}
