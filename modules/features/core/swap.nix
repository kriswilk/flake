{
  features.core_swap = {
    nixos = {
      swapDevices = [
        {
          device = "/swapfile";
          size = 8 * 1024; # 8 GB
        }
      ];
    };
  };
}
