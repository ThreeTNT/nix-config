{
  pkgs,
  config,
  flake-inputs,
  lib,
  ...
}@inps:
let
  username = "lena";
  importfn = x: (import x) (inps // { inherit username; });
  all-modules = map importfn (
    lib.fileset.toList (
      lib.fileset.difference (flake-inputs.globset.lib.glob ./. "**/*.nix") ./${username}.nix
    )
  );
in
{
  sops.secrets.weak-password.neededForUsers = true;
  users.users.lena = {
    isNormalUser = true;
    group = "wheel";
    extraGroups = [
      "input"
      "video"
    ];
    shell = pkgs.fish;
    hashedPasswordFile = config.sops.secrets.weak-password.path;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICw7CHZkiNoG7StuF3NBnCHRWvsujJdX4ZTDIhz6YonH"
    ];
  };

  home-manager.backupFileExtension = "hm-backup";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = {
    imports = [ 
      flake-inputs.catppuccin.homeModules.catppuccin 
      flake-inputs.caelestia-shell.homeManagerModules.default
    ];

    catppuccin.accent = "mauve";

    xdg.userDirs = {
      createDirectories = true;
      desktop = true;
      documents = true;
      download = true;
      pictures = true;
    };

    home.stateVersion = config.system.stateVersion;
  };

  imports = all-modules;
}
