{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    naps2
  ];
}
