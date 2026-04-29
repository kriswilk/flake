{
  pkgs,
  ...
}:

{
  programs.nh = {
    enable = true;
  };

  home.packages = with pkgs; [
    steam-run
  ];
}
