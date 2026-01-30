{
  description = "NixOS Host & User Configuration";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    hostDir = ./host;
    userDir = ./user;
    hostList = ["vm" "desktop"];
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hostList (hostName: nixpkgs.lib.nixosSystem {
      modules = [
        "${hostDir}/${hostName}"
        inputs.disko.nixosModules.disko
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              inputs.nix-index-database.homeModules.default
              inputs.nvf.homeManagerModules.default
            ];
            extraSpecialArgs = { inherit inputs; };
          };
        }
        inputs.stylix.nixosModules.stylix
      ];
      specialArgs = { inherit hostDir hostName userDir; };
    });
  };
}