{
  description = "NixOS configuration for Jason Rogena";
  
  # This file should act as glue, importing other modules. Refrain from adding
  # configurations in it, apart from those specifically configuring flakes

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    system.stateVersion = "24.11";
    nixosConfigurations = {
      nixos-test = let
        system = "aarch64-linux";
      in
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/nixos/common
            ./hosts/nixos-test
          ];
        };
    };
    homeConfigurations = {
      "jrogena@nixos-test" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./users/jrogena
        ];
      };
    };
  };
}
