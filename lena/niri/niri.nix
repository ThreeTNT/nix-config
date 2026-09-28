{ flake-inputs, pkgs, ... }: {
  home-manager.users.lena.programs.niri = {
    enable = true;
    package = flake-inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-stable;
    # package = null;
  };

  imports = [
    ./general.nix
    ./rules.nix
    ./binds.nix
  ];
}
