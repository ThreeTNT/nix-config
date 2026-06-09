{
  pkgs,
  flake-inputs,
  config,
  ...
}:
let
  spice-pkgs = flake-inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  home-manager.users.lena = {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spice-pkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
      ];
      theme = spice-pkgs.themes.catppuccin;
      colorScheme = config.home-manager.users.lena.catppuccin.flavor;
    };
  };
}
