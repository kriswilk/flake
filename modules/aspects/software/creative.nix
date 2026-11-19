{
  flake.modules.homeManager.software-creative =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        # audio
        audacity

        # image
        gimp
        inkscape
        krita

        # office
        libreoffice
      ];
    };
}
