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
}
