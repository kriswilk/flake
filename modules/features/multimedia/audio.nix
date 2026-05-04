{
  features.multimedia_audio = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          audacity
        ];
      };
  };
}
