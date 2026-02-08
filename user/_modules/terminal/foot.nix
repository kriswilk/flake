{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;

    server = {
      enable = true;
    };

    settings = {
      main = {
        initial-window-size-chars = "80x25";
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
