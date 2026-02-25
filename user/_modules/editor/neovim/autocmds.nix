{
  programs.nvf.settings.vim = {
    # WIP: this isn't working...
    # non-default indents
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
