{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    imagemagick
    resvg

    #gimp3
    #inkscape
    #krita
  ];
}