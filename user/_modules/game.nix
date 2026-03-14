{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    prismlauncher
    sgt-puzzles
  ];
}
