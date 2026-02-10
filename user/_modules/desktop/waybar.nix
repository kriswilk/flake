{ config, lib, pkgs, ... }:

{
  stylix.targets.waybar = {
    enable = false;
  };

  programs.waybar = {
    enable = true;
  };
  
  xdg.configFile."waybar/config.jsonc".source = ../../_dotfiles/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../_dotfiles/waybar/style.css;
}
