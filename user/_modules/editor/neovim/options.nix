{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
{
  programs.nvf.settings.vim = {
    viAlias = false;
    vimAlias = false;

    globals = {
      editorconfig = true;
      mapleader = " ";
      maplocalleader = ",";
    };

    options = {
      # file saving
      backup = false;
      writebackup = false;
      swapfile = false;

      # gutter, numbering, cursor
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      cursorline = true;
      cursorlineopt = "line";

      # indent & wrap
      tabstop = 8;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      wrap = false;

      # case sensitivity
      ignorecase = true;
      smartcase = true;

      # other ui
      scrolloff = 3;
      showmode = false;

      # splits
      splitbelow = true;
      splitright = true;

      # other
      updatetime = 300;

      # other nvf defaults listed explicitly
      encoding = "utf-8";
      hidden = true;
      mouse = "nvi";
      termguicolors = true;
      tm = 500;
    };

    highlight = {
      DiagnosticError = {
        fg = red;
      };
      DiagnosticWarn = {
        fg = yellow;
      };
      DiagnosticHint = {
        fg = green;
      };
      DiagnosticInfo = {
        fg = blue;
      };
    };
  };
}
