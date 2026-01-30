{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    naps2
    # WIP: fineprint?
  ];
}