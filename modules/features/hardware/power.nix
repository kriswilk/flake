{
  features.hardware_power = {
    nixos = {
      services.power-profiles-daemon = {
        enable = true;
      };

      services.upower = {
        enable = true;
      };
    };
  };
}
