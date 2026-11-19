{
  flake.modules.nixos.hardware-power = {
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
