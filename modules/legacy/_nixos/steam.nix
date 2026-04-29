{
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;

    # fixes black screen on steam UI (web views)
    package = pkgs.steam.override {
      extraArgs = "-system-composer";
    };

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  # WIP: proton version(s), alternatives?
}
