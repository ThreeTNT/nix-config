{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    limine = {
      enable = true;
      efiSupport = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "vaultwarden";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
  };

  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
