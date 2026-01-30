{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    #jdk
    #prismlauncher
    #sgt-puzzles
  ];
}