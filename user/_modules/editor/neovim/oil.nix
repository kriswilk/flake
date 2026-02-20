{
  programs.nvf.settings.vim = {
    utility.oil-nvim = {
      enable = true;
      gitStatus.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":Oil<CR>";
        desc = "Oil";
      }
    ];
  };
}
