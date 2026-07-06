{ flake-inputs, pkgs, ... }: {
  # NOTE: this assumes `flake-inputs.niri` points at sodiboo/niri-flake, and that
  # `niri.homeModules.niri` has been added to your home-manager.sharedModules
  # (or imported directly for a standalone home-manager setup). That flake is
  # what provides the `programs.niri.settings` option used throughout this
  # config, and validates the generated config.kdl at build time.
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
