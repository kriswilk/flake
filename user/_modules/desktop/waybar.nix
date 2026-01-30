{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ../../_dotfiles/waybar/style.css;
  };
  xdg.configFile."waybar/config".source = ../../_dotfiles/waybar/config.jsonc;
  #xdg.configFile."waybar/style.css".source = ../../_dotfiles/waybar/style.css;
}