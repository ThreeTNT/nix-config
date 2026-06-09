{
  pkgs,
  config,
  lib,
  ...
}:
let
  flavor = config.home-manager.users.lena.catppuccin.flavor;
  accent = config.home-manager.users.lena.catppuccin.accent;

  theme = pkgs.callPackage ../packages/catppuccin-kde.nix { flavor = flavor; };
  file-nm = "Catppuccin${lib.toSentenceCase flavor}${lib.toSentenceCase accent}.colors";
in
{
  home-manager.users.lena = {
    xdg.dataFile."color-schemes/${file-nm}".source = "${theme}/share/color-schemes/${file-nm}";
  };
}
