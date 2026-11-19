{
  inputs,
  mkHost,
  ...
}:
{
  flake.nixosConfigurations.vm = mkHost "vm" {
    users = [
      "daniela"
      "guest"
      "hugo"
      "kris"
    ];
  };

  flake.modules.nixos.hosts-vm = {
    imports = [
      inputs.self.modules.nixos.hosts-vm-hardware
      inputs.self.modules.nixos.profiles-all
    ];

    disko.devices.disk.main.device = "/dev/sda";
    virtualisation.virtualbox.guest.enable = true;
  };

  # hardware-configuration.nix
  flake.modules.nixos.hosts-vm-hardware =
    {
      lib,
      ...
    }:
    {
      boot.initrd.availableKernelModules = [
        "ata_piix"
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
