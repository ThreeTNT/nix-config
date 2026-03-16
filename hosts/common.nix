{ flake-inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ../core/core.nix
    ../secrets/secrets.nix
    ../users/users.nix

    flake-inputs.catppuccin.nixosModules.catppuccin
  ];
}
