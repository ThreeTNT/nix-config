{ pkgs, flake-inputs, ... }:
{
  nixpkgs.overlays = [
    flake-inputs.niri-nix.overlays.niri
  ];

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    autoLogin = {
      # only enabled for remote sunshine reboot
      enable = true;
      user = "lena";
    };
  };

  programs.niri = {
    enable = true;
    package = flake-inputs.niri-nix.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    QT_QPA_PLATFORM = "wayland";
  };
}
