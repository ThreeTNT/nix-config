{ lib, ... }:
let
  monitor-res = "2560x1440";
in
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = false;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      gfxmodeEfi = monitor-res;
      gfxmodeBios = monitor-res;
    };

    limine = {
      enable = true;
      resolution = monitor-res + "x32";
      efiSupport = true;
      maxGenerations = 10;
      extraEntries = ''
        /Windows
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
    timeout = 30;
  };
  catppuccin.limine.enable = true;
}
