{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix/master";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    globset.url = "github:pdtpartners/globset";
    globset.inputs.nixpkgs-lib.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      flake-parts-inputs@{ ... }:
      {
        systems = [
          "x86_64-linux"
        ];

        imports = [
          ./hosts/hosts.nix
        ];
      }
    );
}
