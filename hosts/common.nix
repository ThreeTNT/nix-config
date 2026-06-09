{
  flake-inputs,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ../core/core.nix
  ];
}
