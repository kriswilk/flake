{
  pkgs,
  ...
}:

{
  # TODO: re-enable once build deps are cached...
  # programs.mpv = {
  #   enable = true;
  # };

  home.packages = with pkgs; [
    ffmpeg
    handbrake
    mkvtoolnix
  ];
}
