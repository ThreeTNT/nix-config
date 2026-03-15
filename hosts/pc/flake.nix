{ inputs, ... }:
{
  flake.nixosConfigurations.lenas-pc = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      flake-inputs = inputs;
      gui-system = true;
    };
    modules = [
      ../common.nix
      ./configuration.nix
      inputs.home-manager.nixosModules.home-manager
      # inputs.hyprland.homeManagerModules.default
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
