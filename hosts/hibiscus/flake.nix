{ inputs, ... }:
{
  flake.darwinConfigurations.hibiscus = inputs.nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";

    specialArgs = {
      flake-inputs = inputs;

      host-config = {
        gui = true;
        battery = true;
        gpu = "metal";
      };
    };

    modules = [
      ../../common.nix
      ./configuration.nix
      inputs.home-manager.darwinModules.home-manager
      inputs.sops-nix.darwinModules.sops
    ];
  };
}
