{ pkgs, flake-inputs, ... }:
{
  home-manager.users.lena = {
    home.packages = [
      flake-inputs.opencode-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
