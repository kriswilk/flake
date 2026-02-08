{ config, lib, pkgs, ... }:

{
  # WIP: determine best timeouts, proper commands
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      #{ timeout = 90; command = "systemctl suspend"; }
    ];
    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
    };
  };
}
