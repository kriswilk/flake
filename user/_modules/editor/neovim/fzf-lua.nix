{
  programs.nvf.settings.vim = {
    fzf-lua.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>fb";
        action = ":FzfLua buffers<CR>";
        desc = "[F]ind [B]uffer";
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
      {
        mode = "n";
        key = "<leader>ft";
        action = ":FzfLua builtin<CR>";
        desc = "[F]ind Buil[t]in";
      }
    ];
  };
}
