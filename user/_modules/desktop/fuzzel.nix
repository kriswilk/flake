{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
let
  opaque = color: color + "ff";
in
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = 40;
        lines = 10;
        horizontal-pad = 25;
        vertical-pad = 25;
        inner-pad = 25;

        prompt = "''";
        placeholder = "Begin typing...";
        match-counter = true;
        icons-enabled = "no";
        use-bold = true;

        keyboard-focus = "on-demand";
        cache = "/dev/null";

        font = lib.mkForce "monospace:size=14";
      };
      colors = {
        border = lib.mkForce (opaque blue); # WIP: make sure niri border matches!
        placeholder = lib.mkForce (opaque base03);
        counter = lib.mkForce (opaque base03);
        selection = lib.mkForce (opaque base01);
      };
      border = {
        width = 4;
        radius = 8;
      };
    };
  };
}