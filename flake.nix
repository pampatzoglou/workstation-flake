{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }:
    let
      # Common modules shared between NixOS and Darwin
      #commonModules = [
      #  ./common/base.nix
      #  ./common/personal.nix
      #  ./common/infrastructure.nix
      #  ./common/kubernetes.nix
      #  ./common/development.nix
      #  ./common/monitoring.nix
      #  ./common/network.nix
      #  ./common/security.nix
      ];
    in {
      # NixOS configuration
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pantelis = import ./common/home.nix;
          }
        ] ++ commonModules;
      };

      # Darwin (macOS) configuration
      darwinConfigurations.default = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./darwin/configuration.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pantelis = import ./common/home.nix;
          }
        ] ++ commonModules;
      };
    };
}
