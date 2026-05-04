{
  features.hardware_network = {
    nixos = {
      networking.networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };
      # improve the appearance of nmtui
      environment.variables = {
        NEWT_COLORS = ''
          root=black,black
          border=lightgray,black
          window=lightgray,black
          shadow=black,black
          title=yellow,black
          button=black,blue
          actbutton=blue,white
          compactbutton=lightgray,black
          checkbox=lightgray,black
          actcheckbox=black,lightgray
          entry=lightgray,black
          disentry=black,gray
          label=white,black
          listbox=lightgray,black
          actlistbox=blue,black
          sellistbox=black,blue
          actsellistbox=black,blue
          textbox=white,black
          acttextbox=blue,black
          emptyscale=,gray
          fullscale=,blue
          helpline=black,white
          roottext=black,lightgrey
        '';
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
