{
  features.network = {
    nixos = {
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
