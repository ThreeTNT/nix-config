{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    nmap

    pciutils
    usbutils
    lm_sensors
    pwvucontrol
    ethtool

    clang-tools
    cmake

    ty
    ruff
    nixd
    nixfmt
    nixfmt-tree
  ];
}
