{
  description = "NixOS Host & User Configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    themes = {
      url = "github:kriswilk/themes";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      hostDir = ./host;
      userDir = ./user;
      hostList = [
        "vm"
        "desktop"
      ];
    in
    {
      nixosConfigurations = nixpkgs.lib.genAttrs hostList (
        hostName:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              hostDir
              hostName
              userDir
              ;
          };
          modules = [
            (hostDir + "/${hostName}")
            inputs.disko.nixosModules.disko
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [
                  inputs.nix-index-database.homeModules.default
                  inputs.nvf.homeManagerModules.default
                ];
              };
            }
            inputs.stylix.nixosModules.stylix
          ];
        }
      );
    };
}
