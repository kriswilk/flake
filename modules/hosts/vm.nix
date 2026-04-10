{ self, inputs, ... }:
{
  flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      { networking.hostName = "vm"; }
      ../../host/vm
      inputs.disko.nixosModules.disko
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          # extraSpecialArgs = { inherit inputs; };
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

      self.nixosModules.cowsay

      self.nixosModules.audio
      self.nixosModules.bluetooth
      self.nixosModules.bootloader
      self.nixosModules.locale
      self.nixosModules.nixos
      self.nixosModules.swap

      self.nixosModules.flatpak
    ];
  };
}
