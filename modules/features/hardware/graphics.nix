{
  features,
  ...
}:
{
  features.hardware_graphics = {
    nixos = {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };

  features.hardware_graphics_nvidia = {
    includes = [
      features.hardware_graphics
    ];

    nixos = {
      hardware.nvidia.open = true;
      services.xserver.videoDrivers = [ "nvidia" ];
    };
  };
}
