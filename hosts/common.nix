{ flake-inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ../core/core.nix
    ../users/users.nix

    flake-inputs.catppuccin.nixosModules.catppuccin
  ];
}
