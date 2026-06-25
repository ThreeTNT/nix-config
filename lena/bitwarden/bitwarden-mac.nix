{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10" # TODO: remove
  ];
  homebrew.casks = [ "bitwarden" ];
}
