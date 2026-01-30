{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #imhex
    #kdePackages.kate # already installed?
  ];
}