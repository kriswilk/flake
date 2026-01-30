{ config, lib, pkgs, ... }:

{
  services.cliphist = {
    enable = true;
  };

  home.packages = with pkgs; [
    wl-clipboard
    wtype
  ];
}