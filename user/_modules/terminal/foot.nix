{
  ...
}:

{
  stylix.targets.foot.enable = true;

  programs.foot = {
    enable = true;

    server = {
      enable = true;
    };

    settings = {
      main = {
        initial-window-size-chars = "80x25";
        pad = "5x5";
        resize-by-cells = false;
        resize-keep-grid = "no";
      };
      csd = {
        preferred = "none";
      };
      cursor = {
        style = "beam";
      };
      scrollback = {
        lines = 10000;
      };
    };
  };
}
