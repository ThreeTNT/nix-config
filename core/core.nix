{
  flake-inputs,
  lib,
  pkgs,
  ...
}:
{
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    sops
    age
    ssh-to-age

    zip
    unzip
    xz

    ripgrep
    jq
    yq-go

    file
    eza

    btop
    fastfetch

    nmap
    pciutils
    usbutils
    lm_sensors
    ethtool
  ];

  imports = lib.fileset.toList (
    lib.fileset.difference (flake-inputs.globset.lib.glob ./. "**/*.nix") ./core.nix
  );
}
