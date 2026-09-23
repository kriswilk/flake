{
  features.terminal_foot = {
    homeManager = {
      programs.foot = {
        enable = true;

        settings = {
          main = {
            font = "monospace:size=10";
            initial-window-size-chars = "80x25";
            pad = "5x5";
            resize-by-cells = false;
            resize-keep-grid = "no";
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
    };
  };
}
