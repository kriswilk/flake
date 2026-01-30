{ inputs, config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    lynx
  ];
}