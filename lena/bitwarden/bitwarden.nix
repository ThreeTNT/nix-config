{ pkgs }:
if pkgs.stdenv.isLinux then
  {
    home-manager.users.lena = {
      home.packages = with pkgs; [
        bitwarden-desktop
      ];
    };
  }
else
  {
    nixpkgs.config.permittedInsecurePackages = [
      "electron-39.8.10" # TODO: remove
    ];
    homebrew.casks = [ "bitwarden" ];
  }
