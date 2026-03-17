{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    zip
    unzip
    xz

    ripgrep
    jq
    yq-go

    file

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
