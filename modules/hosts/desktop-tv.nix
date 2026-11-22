{
  inputs,
  mkHost,
  ...
}:
{
  flake.nixosConfigurations.desktop-tv = mkHost "desktop-tv" {
    users = [
      "daniela"
      "guest"
      "hugo"
      "kris"
    ];
  };

  flake.modules.nixos.hosts-desktop-tv = {
    imports = [
      inputs.self.modules.nixos.hosts-desktop-tv-hardware
      inputs.self.modules.nixos.profiles-all
    ];
  };

  # hardware-configuration.nix
  flake.modules.nixos.hosts-desktop-tv-hardware =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
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
}
