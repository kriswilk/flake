{ config, lib, pkgs, ... }:

{
  programs.btop = {
    enable = true;
  };

  programs.fastfetch = {
    enable = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    ethtool
    lm_sensors
    lsof
    ltrace
    pciutils
    strace
    sysstat
    usbutils
  ];
}