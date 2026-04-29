{
  templates,
  ...
}:
{
  den.hosts.x86_64-linux.desktop-tv.users = {
    guest = { };
    kris = { };
    daniela = { };
    hugo = { };
  };

  den.aspects.desktop-tv = {
    includes = [
      templates.host
    ];

    nixos =
      {
        config,
        lib,
        modulesPath,
        ...
      }:
      {
        # disko
        disko.devices.disk.main.device = "/dev/nvme0n1";

        # hardware-configuration.nix
        imports = [
          (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot.initrd.availableKernelModules = [
          "xhci_pci"
          "ahci"
          "nvme"
          "usbhid"
          "usb_storage"
          "sd_mod"
        ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "kvm-intel" ];
        boot.extraModulePackages = [ ];

        nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
  };
}
