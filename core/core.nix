{
  flake-inputs,
  lib,
  pkgs,
  ...
}:
{
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    eza
  ];

  imports = lib.fileset.toList (
    lib.fileset.difference (flake-inputs.globset.lib.glob ./. "**/*.nix") ./core.nix
  );
}
