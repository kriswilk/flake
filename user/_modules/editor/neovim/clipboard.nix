{
  programs.nvf.settings.vim = {
    keymaps = [
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>y";
        action = "\"+y";
        desc = "Yank (clipboard)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>Y";
        action = "\"+Y";
        desc = "Yank to End (clipboard)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>d";
        action = "\"+d";
        desc = "Delete (clipboard)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>D";
        action = "\"+D";
        desc = "Delete to End (clipboard)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>p";
        action = "\"+p";
        desc = "Paste After/Below (clipboard)";
      }
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>P";
        action = "\"+P";
        desc = "Paste Before/Above (clipboard)";
      }
      {
        mode = "i";
        key = "<C-v>";
        action = "<C-r>+";
        desc = "Paste (clipboard)";
      }
    ];
  };
}
