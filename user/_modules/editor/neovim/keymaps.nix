{
  programs.nvf.settings.vim = {
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
        key = "<Esc>";
        action = ":nohlsearch<CR>";
        silent = true;
        desc = "Dismiss Search Highlights";
      }

      # navigate buffers
      {
        mode = "n";
        key = "<leader>bp";
        action = ":bprevious<CR>";
        desc = "Previous Buffer";
      }
      {
        mode = "n";
        key = "<leader>bn";
        action = ":bnext<CR>";
        desc = "Next Buffer";
      }
      {
        mode = "n";
        key = "<leader><Tab>";
        action = "<C-^>";
        desc = "Alternate Buffer";
      }
    ];
  };
}
