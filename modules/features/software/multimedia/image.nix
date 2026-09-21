{
  features.multimedia_image = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          gimp
          imagemagick
          inkscape
          krita
          resvg
        ];
      };
  };
}
