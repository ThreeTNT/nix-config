{
  username,
  pkgs,
  lib,
  host-config,
  flake-inputs,
  ...
}:
lib.mkIf host-config.gui {
  nixpkgs.overlays = [ flake-inputs.dolphin-overlay.overlays.default ];

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.dolphin
    ];
  };
}
