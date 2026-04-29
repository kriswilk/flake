{
  ...
}:

{
  programs.foot = {
    enable = true;

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
      environment = {
        SHLVL = 0;
      };
      scrollback = {
        lines = 10000;
      };
    };
  };
}
