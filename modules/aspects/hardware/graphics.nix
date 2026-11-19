{
  flake.modules.nixos.hardware-graphics =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.nvidia.enable = lib.mkEnableOption "NVIDIA GPU support";

      config = {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        hardware.nvidia.open = lib.mkIf config.custom.nvidia.enable true;
        services.xserver.videoDrivers = lib.mkIf config.custom.nvidia.enable [ "nvidia" ];
      };
    };
}
