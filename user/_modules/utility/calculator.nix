{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    bc
    libqalculate
    qalculate-qt
  ];
}