{ config, lib, pkgs, ... }:

{
  options.gpu-nvidia-open.enable = lib.mkEnableOption "NVIDIA GPU configuration using open-source drivers";

  config = lib.mkIf config.gpu-nvidia-open.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
  };
}