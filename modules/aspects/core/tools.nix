{
  flake.modules.nixos.core-tools =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = with pkgs; [
        # archive
        unzip
        zip

        # file
        curl
        tree
        wget

        # system
        btop
        fastfetch
      ];
    };

  flake.modules.homeManager.core-tools =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        # archive
        p7zip
        unzip
        zip

        # browser
        lynx

        # disk
        fio
        smartmontools

        # file
        curl
        file
        rclone
        rsync
        tree
        wget

        # network
        dnsutils
        iperf3

        # security
        gnupg

        # system
        brightnessctl
        ethtool
        fastfetch
        lm_sensors
        lsof
        ltrace
        pciutils
        strace
        sysstat
        usbutils

        # text
        gawk
        gnugrep
        gnused
        jq
        ripgrep
        yq
      ];

      # system
      programs.btop.enable = true;
    };
}
