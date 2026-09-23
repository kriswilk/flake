{
  features.hardware_network = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        networking.networkmanager = {
          enable = true;
          wifi.backend = "iwd";
        };

        services.openssh = {
          enable = true;
        };

        services.tailscale = {
          enable = true;
        };

        environment.systemPackages = with pkgs; [
          cifs-utils
        ];
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        services.ssh-agent = {
          enable = true;
        };

        home.packages = with pkgs; [
          dnsutils
          iperf3
        ];
      };
  };
}
