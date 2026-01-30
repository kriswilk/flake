{ config, lib, pkgs, ... }:

{
  services.ssh-agent = {
    enable = true;
  };

  home.packages = with pkgs; [
    dnsutils
    iperf3

    #angryipscanner
    #kdePackages.krdc # already installed?
    #wireshark

    # WIP: need these?
    # mtr # A network diagnostic tool
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
  ];
}