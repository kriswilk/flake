{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    fio
    smartmontools
  ];
}
