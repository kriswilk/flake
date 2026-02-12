{ config, lib, pkgs, ... }:

{
  # WIP: still needs work, refactor to modules
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = false;

      lsp.enable = true;

      statusline.lualine.enable = true;
      fzf-lua.enable = true;
      utility.oil-nvim.enable = true;
      autocomplete.nvim-cmp.enable = true;

      globals = {
        editorconfig = true;
        mapleader = " ";
        maplocalleader = ",";
      };

      languages = {
        enableTreesitter = true;

        lua.enable = true;
        nix.enable = true;
        python.enable = true;
      };

      keymaps = [
        # save, quit, and reload config
        {
          mode = "n";
          key = "<leader>w";
          action = ":write<CR>";
          desc = "Save";
        }
        {
          mode = "n";
          key = "<leader>q";
          action = ":quit<CR>";
          desc = "Quit";
        }
        {
          mode = "n";
          key = "<leader>o";
          action = ":update<CR>:source<CR>";
          desc = "Update and Source Config";
        }
        # exit insert mode
        {
          mode = "i";
          key = "jk";
          action = "<Esc>";
          silent = true;
          desc = "Exit Insert Mode";
        }
        # dismiss search highlights
        {
          mode = "n";
          key = "<Esc><Esc>";
          action = ":nohlsearch<CR>";
          silent = true;
          desc = "Dismiss Search Highlights";
        }
        # system clipboard
        {
          mode = ["n" "x"];
          key = "<leader>y";
          action = "\"+y";
          desc = "Yank (clipboard)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>Y";
          action = "\"+Y";
          desc = "Yank to End (clipboard)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>d";
          action = "\"+d";
          desc = "Delete (clipboard)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>d";
          action = "\"+D";
          desc = "Delete to End (clipboard)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>p";
          action = "\"+p";
          desc = "Paste After/Below (clipboard)";
        }
        {
          mode = ["n" "x"];
          key = "<leader>p";
          action = "\"+P";
          desc = "Paste Before/Above (clipboard)";
        }
        {
          mode = "i";
          key = "<C-v>";
          action = "<C-r>+";
          desc = "Paste (clipboard)";
        }
        # format buffer
        {
          mode = "n";
          key = "<leader>lf";
          action = ":lua vim.lsp.buf.format";
          desc = "Format Buffer";
        }
        # fzf-lua
        {
          mode = "n";
          key = "<leader>fb";
          action = ":FzfLua builtin<CR>";
          desc = "[F]ind [B]uiltin";
        }
        {
          mode = "n";
          key = "<leader>ff";
          action = ":FzfLua files<CR>";
          desc = "[F]ind [F]ile";
        }
        {
          mode = "n";
          key = "<leader>fg";
          action = ":FzfLua live_grep<CR>";
          desc = "[F]ind [G]rep";
        }
        {
          mode = "n";
          key = "<leader>fh";
          action = ":FzfLua helptags<CR>";
          desc = "[F]ind [H]elp Tag";
        }
        {
          mode = "n";
          key = "<leader>fk";
          action = ":FzfLua keymaps<CR>";
          desc = "[F]ind [K]eymap";
        }
        {
          mode = "n";
          key = "<leader>fm";
          action = ":FzfLua manpages<CR>";
          desc = "[F]ind [M]anpage";
        }
        {
          mode = "n";
          key = "<leader>fo";
          action = ":FzfLua oldfiles<CR>";
          desc = "[F]ind [O]ld File";
        }
        {
          mode = "n";
          key = "<leader>fr";
          action = ":FzfLua resume<CR>";
          desc = "[F]ind [R]esume";
        }
        # oil
        {
          mode = "n";
          key = "-";
          action = ":Oil<CR>";
          desc = "Oil";
        }
      ];

      options = {
        # gutter & cursor
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
        autoindent = true;
        wrap = false;

        # other ui
        scrolloff = 3;
        cmdheight = 1;
        showmode = false;
        winborder = "rounded";

        # case sensitivity
        ignorecase = true;
        smartcase = true;

        # splits
        splitbelow = true;
        splitright = true;

        # other
        updatetime = 300;

        # other nvf defaults listed explicitly
        backup = false;
        encoding = "utf-8";
        errorbells = false;
        hidden = true;
        mouse = "nvi";
        swapfile = false;
        termguicolors = true;
        tm = 500;
        visualbell = false;
        writebackup = false;
      };
    };
  };
}
