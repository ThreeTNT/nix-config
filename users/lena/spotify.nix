{
  host-config,
  pkgs,
  username,
  lib,
  flake-inputs,
  config,
  ...
}:
lib.mkIf host-config.gui (
  let
    spice-pkgs = flake-inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  in
  {
    home-manager.users.${username} = {
      programs.spicetify = {
        enable = true;
        enabledExtensions = with spice-pkgs.extensions; [
          adblockify
          hidePodcasts
          shuffle
        ];
        theme = spice-pkgs.themes.catppuccin;
        colorScheme = config.home-manager.users.${username}.catppuccin.flavor;
      };
    };
  }
)
