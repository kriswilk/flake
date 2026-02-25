{
  programs.nvf.settings.vim = {
    visuals.blink-indent = {
      enable = true;
      setupOpts = {
        static.highlights = [ "BlinkIndent" ];
        static.char = "┆";
        scope.highlights = [ "BlinkIndentScope" ];
        scope.char = "│";
      };
    };

    highlight = {
      BlinkIndent = {
        fg = "#222222";
      };
      BlinkIndentScope = {
        fg = "#666666";
      };
    };
  };
}
