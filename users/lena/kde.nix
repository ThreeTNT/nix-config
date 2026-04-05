{
  pkgs,
  username,
  host-config,
  config,
  lib,
  ...
}:
lib.mkIf host-config.gui
(let
  flavor = config.home-manager.users.${username}.catppuccin.flavor;
  accent = config.home-manager.users.${username}.catppuccin.accent;

  theme = pkgs.callPackage 
    ./packages/catppuccin-kde.nix
    { flavor = flavor; };
  file-nm = "Catppuccin${lib.toSentenceCase flavor}${lib.toSentenceCase accent}.colors";
in
{
  home-manager.users.${username} = {
    xdg.dataFile."color-schemes/${file-nm}".source 
      = "${theme}/share/color-schemes/${file-nm}";
  };
})