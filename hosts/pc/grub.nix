{ ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;

      gfxmodeEfi = "2560x1440";
      gfxmodeBios = "2560x1440";
    };
    timeout = 30;
  };
}
