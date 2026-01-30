{ config, lib, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = false;
      
      lsp.enable = true;

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;
      
      languages = {
        enableTreesitter = true;

        nix.enable = true;
        ts.enable = true;
        python.enable = true;
        lua.enable = true;
        rust.enable = true;
      };
    };
  };
}