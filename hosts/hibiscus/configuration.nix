{
  lib,
  flake-inputs,
  host-config,
  pkgs,
  ...
}:
{
  nix.gc = {
    automatic = true;
    interval = {
      Day = 1;
      Hour = 0;
      Minute = 0;
    };
    options = "--delete-older-than 7d";
  };

  time.timeZone = "America/Toronto";

  # system.defaults.NSGlobalDomain.AppleLanguages = [ "en-CA" ];
  # system.defaults.NSGlobalDomain.AppleLocale = "en_CA";
  # system.defaults.NSGlobalDomain.AppleMeasurementUnits = "Centimeters";
  # system.defaults.NSGlobalDomain.AppleMetricUnits = 1;

  programs.zsh.enable = true;

  home-manager.extraSpecialArgs = {
    inherit flake-inputs host-config;
  };

  environment.systemPackages = with pkgs; [
    # Empty for now
  ];

  imports = [
    ./lena.nix
    ../../lena/lena.nix
  ];

  environment.shells = [ pkgs.fish ];

  environment.extraInit = lib.mkAfter ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  system.stateVersion = 5;
}
