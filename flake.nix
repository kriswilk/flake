{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    themes = {
      url = "github:kriswilk/themes";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          { networking.hostName = "vm"; }
          ./host/vm
          inputs.disko.nixosModules.disko
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                inputs.nix-index-database.homeModules.default
                inputs.sops-nix.homeManagerModules.sops
              ];
            };
          }
          inputs.sops-nix.nixosModules.sops
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
}
