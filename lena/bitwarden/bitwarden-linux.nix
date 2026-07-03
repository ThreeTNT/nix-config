{ pkgs, ... }:
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10" # TODO: remove
  ];

  home-manager.users.lena = {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
