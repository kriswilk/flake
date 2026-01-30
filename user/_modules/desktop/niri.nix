{ config, lib, pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".source = ../../_dotfiles/niri/config.kdl;

  home.packages = with pkgs; [
    xwayland-satellite
  ];
}