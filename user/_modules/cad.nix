{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #blender
    #freecad
    #kicad
    #prusa-slicer
  ];
}