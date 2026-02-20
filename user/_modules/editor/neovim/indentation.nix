{
  programs.nvf.settings.vim = {
    visuals = {
      blink-indent = {
        enable = true;
        setupOpts = {
          static.highlights = [ "BlinkIndent" ];
          static.char = "┆";
          scope.highlights = [ "BlinkIndentScope" ];
          scope.char = "│";
        };
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

    # WIP: this isn't working...
    autocmds = [
      {
        event = [ "FileType" ];
        pattern = [
          "css"
          "html"
          "javascript"
          "lua"
          "nix"
          "typescript"
          "xml"
        ];
        command = "setlocal shiftwidth=2 softtabstop=2";
      }
    ];
  };
}
