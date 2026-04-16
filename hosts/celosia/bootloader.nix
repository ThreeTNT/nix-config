{ ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    # grub = {
    #   enable = true;
    #   efiSupport = true;
    #   device = "nodev";
    #   useOSProber = true;

    #   gfxmodeEfi = "3440x1440";
    #   gfxmodeBios = "3440x1440";
    # };
    limine = {
      enable = true;
      resolution = "3440x1440x32";
      efiSupport = true;
      maxGenerations = 10;
    };
    timeout = 30;
  };
  catppuccin.limine.enable = true;
}
