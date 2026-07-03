{
  programs.nix-ld.enable = true;

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

  imports = [
    ../../lena/lena.nix
    ./lena.nix
    ./secrets/secrets.nix
    ./network.nix
    ./hardware.nix
    ./bootloader.nix
  ];

  system.stateVersion = "26.05";
}
