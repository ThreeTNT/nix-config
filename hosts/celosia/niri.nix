{ pkgs, flake-inputs, ... }:
{
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://niri.cachix.org"
      "https://niri-epireyn.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "niri-epireyn.cachix.org-1:tlVyFN7CtsDT+ZcLPS+ekFWeT1X6X4OqvWqbBMyIzFA="
    ];
  };

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
    package = flake-inputs.niri-nix.packages.${pkgs.stdenv.hostPlatform.system}.niri-stable;
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
