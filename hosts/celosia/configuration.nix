{ lib, flake-inputs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_CA.UTF-8";
    LC_MONETARY = "en_CA.UTF-8";
    LC_MEASUREMENT = "en_CA.UTF-8";
  };

  imports = lib.fileset.toList (
    lib.fileset.difference (flake-inputs.globset.lib.glob ./. "**/*.nix") (
      lib.fileset.unions [
        ./configuration.nix
        ./flake.nix
      ]
    )
  );

  system.stateVersion = "25.11";
}
