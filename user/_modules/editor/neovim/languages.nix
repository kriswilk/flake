{
  programs.nvf.settings.vim = {
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      bash.enable = true;
      clang.enable = true;
      cmake.enable = true;
      css.enable = true;
      go.enable = true;
      html.enable = true;
      java.enable = true;
      jinja.enable = true;
      json.enable = true;
      lua.enable = true;
      make.enable = true;

      markdown = {
        enable = true;
        extensions.markview-nvim.enable = true;
      };

      nix = {
        enable = true;
        format.type = [ "nixfmt" ];
        lsp.servers = [ "nixd" ];
      };

      php.enable = true;

      python = {
        enable = true;
        format.type = [ "ruff" ];
      };

      rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
      };

      sql.enable = true;
      tailwind.enable = true;
      toml.enable = true;
      ts.enable = true;

      typst = {
        enable = true;
        extensions.typst-preview-nvim.enable = true;
      };

      xml.enable = true;
      yaml.enable = true;
    };
  };
}
