{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    j4-dmenu-desktop
  ];
}
