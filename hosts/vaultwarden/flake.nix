{ inputs, ... }:
{
  flake.nixosConfigurations.vaultwarden = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      flake-inputs = inputs;

      host-config = {
        gui = false;
        battery = false;
        gpu = "none";
      };
    };
    modules = [
      ../common.nix
      ./configuration.nix
      ./hardware.nix
      ./docker-compose.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
