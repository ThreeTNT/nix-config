{ config, ... }:
{
  services.xserver = {
    enable = true;
  };
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      accelSpeed = "0";
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  services.power-profiles-daemon.enable = true;

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
