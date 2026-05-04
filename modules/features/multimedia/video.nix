{
  features.multimedia_video = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          ffmpeg
          handbrake
          mkvtoolnix
        ];
      };
  };
}
