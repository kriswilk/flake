{ config, lib, pkgs, ... }:

with config.lib.stylix.colors;
let
  transparent = "00000000";
in
{
  stylix.targets.swaylock = {
    enable = false;
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = ./swaylock.png;
      scaling = "center";
      indicator-radius = 256;
      indicator-thickness = 18;

      disable-caps-lock-text = true;

      color = base00;

      bs-hl-color = red;
      key-hl-color = green;

      # transparent
      inside-color = transparent;
      inside-clear-color = transparent;
      inside-ver-color = transparent;
      inside-wrong-color = transparent;

      # transparent
      text-color = transparent;
      text-clear-color = transparent;
      text-ver-color = transparent;
      text-wrong-color = transparent;

      ring-color = base02;
      ring-clear-color = blue;
      ring-ver-color = yellow;
      ring-wrong-color = red;
    };
  };
}