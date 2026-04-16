{ config, ... }:
{
  services.xserver.enable = false;
  services.xserver.videoDrivers = [ "nvidia" ];

  # ???
  nixpkgs.config.cudaSupport = true;

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
