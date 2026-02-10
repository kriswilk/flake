{ config, lib, pkgs, ... }:

{
  stylix.targets.neovim = {
    enable = false;
  };

  programs.neovim = {
    enable = true;
  };

# WIP: old nvf config... remove once new config is tested
#  programs.nvf = {
#    enable = true;
#    settings.vim = {
#      viAlias = false;
#      vimAlias = false;
#      
#      lsp.enable = true;
#
#      statusline.lualine.enable = true;
#      telescope.enable = true;
#      autocomplete.nvim-cmp.enable = true;
#
#      languages = {
#        enableTreesitter = true;
#
#        nix.enable = true;
#        ts.enable = true;
#        python.enable = true;
#        lua.enable = true;
#        rust.enable = true;
#      };
#    };
#  };
}
