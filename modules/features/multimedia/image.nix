{
  features.multimedia_image = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.imv = {
          enable = true;
        };

        home.packages = with pkgs; [
          gimp
          imagemagick
          inkscape
          kdePackages.gwenview
          krita
          resvg
        ];
      };
  };
}
