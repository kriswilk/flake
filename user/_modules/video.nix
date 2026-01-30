{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    mkvtoolnix

    #handbrake
    #stremio
    #vlc
  ];
}