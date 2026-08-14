{
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
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
      socat
    ]
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      ethtool
      appimage-run
    ];

  imports = [
    ./fish/fish.nix
    ./tailscale.nix
    ./ssh.nix
  ];
}
