{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    fio
    smartmontools
    # WIP: ventoy
  ];
}