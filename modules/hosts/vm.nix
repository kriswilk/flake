{
  templates,
  ...
}:
{
  den.hosts.x86_64-linux.vm.users = {
    guest = { };
    kris = { };
    daniela = { };
    hugo = { };
  };

  den.aspects.vm = {
    includes = [
      templates.host
    ];

    nixos =
      {
        lib,
        ...
      }:
      {
        # disko
        disko.devices.disk.main.device = "/dev/sda";

        # hardware-configuration.nix
        imports = [ ];

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
        virtualisation.virtualbox.guest.enable = true;
      };
  };
}
