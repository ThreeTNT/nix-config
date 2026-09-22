{ pkgs, ... }:
let
  fusion360 = pkgs.callPackage ../../packages/fusion-360.nix { };
in
{
  home-manager.users.lena = {
    home.packages = [
      fusion360
      pkgs.wineWowPackages.staging
      pkgs.winetricks
    ];
  };
}
