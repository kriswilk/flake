{ config, lib, pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      #{ timeout = 10; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      #{ timeout = 90; command = "systemctl suspend"; }
    ];
    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
    };
  };
}