{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "5x5";
        resize-by-cells = false;
        resize-keep-grid = "no";
      };
      csd = {
        preferred = "none";
      };
      scrollback = {
        lines = 10000;
      };
    };
  };
}