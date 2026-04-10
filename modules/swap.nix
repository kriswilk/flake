{
  flake.nixosModules.swap = {
    swapDevices = [
      {
        device = "/swapfile";
        size = 8 * 1024; # 8 GB
      }
    ];
  };
}
