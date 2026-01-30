{ config, lib, pkgs, ... }:

{
  programs.jq = {
    enable = true;
  };

  programs.pandoc = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  home.packages = with pkgs; [
    gawk
    gnugrep
    gnused
    poppler
    yq

    #kdePackages.okular # already installed?
    #calibre
    #koreader
  ];
}