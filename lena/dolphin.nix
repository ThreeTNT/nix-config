{
  pkgs,
  flake-inputs,
  ...
}:
{
  # TODO: File associations

  # nixpkgs.overlays = [ flake-inputs.dolphin-overlay.overlays.default ];

  home-manager.users.lena = {
    home.packages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.dolphin
    ];
  };
}
