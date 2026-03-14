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
}
