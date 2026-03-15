{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    zip
    unzip
    xz
    btop

    ripgrep
    jq
    yq-go

    file

    pciutils
    usbutils

    lm_sensors

    clang-tools
    cmake
  ];
}
