{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    pciutils
    usbutils

    lm_sensors

    clang-tools
    cmake

    ty
    ruff
    nixd
    nixfmt
    nixfmt-tree
  ];
}
