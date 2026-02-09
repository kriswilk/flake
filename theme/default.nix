{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;

    base16Scheme = builtins.fetchurl {
      url = "https://github.com/kriswilk/themes/raw/refs/heads/main/ekko/base16/ekko-dark.yaml";
      sha256 = "sha256:0iayy68gzkpgy2insr06244x297pkl1g2m9mahrilaln3bhnc6c6";
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 10;
        desktop = 10;
        popups = 10;
        terminal = 12;
      };
    };
  };
}
