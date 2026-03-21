{
  pkgs,
  ...
}:

{
  stylix.targets.mpv.enable = true;

  programs.mpv = {
    enable = true;
  };

  home.packages = with pkgs; [
    ffmpeg
    handbrake
    mkvtoolnix
  ];
}
