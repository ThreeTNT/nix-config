{
  lib,
  flake-inputs,
  pkgs,
  ...
}:
{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
  };

  security.sudo.wheelNeedsPassword = false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  catppuccin.enable = true;
  catppuccin.autoEnable = false;

  environment.systemPackages = with pkgs; [
    hyprshot
  ];

  imports = [
    ../../lena/lena.nix
    ./lena.nix
    ./nvidia.nix
    ./secrets/secrets.nix
    ./hyprland.nix
    ./network.nix
    ./hardware.nix
    ./bootloader.nix
    ./sunshine.nix
  ];

  system.stateVersion = "25.11";
}
