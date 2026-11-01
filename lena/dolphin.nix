{
  pkgs,
  flake-inputs,
  ...
}:
{
  # File associations live in viewers.nix

  # nixpkgs.overlays = [ flake-inputs.dolphin-overlay.overlays.default ];

  home-manager.users.lena = {
    home.packages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.dolphin

      # image / pdf thumbnails
      kdePackages.kimageformats
      kdePackages.kdegraphics-thumbnailers
    ];
  };
}
