{
  features.desktop_niri = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        programs.niri.enable = true;

        environment.systemPackages = with pkgs; [
          xwayland-satellite
        ];
      };

    homeManager = {
      xdg.configFile."niri/config.kdl".source = ./config.kdl;
    };
  };
}
