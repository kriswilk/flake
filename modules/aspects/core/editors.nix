{
  flake.modules.nixos.core-editors = {
    programs.nano.enable = true;
    programs.neovim.enable = true;
    programs.vim.enable = true;
  };

  flake.modules.homeManager.core-editors =
    {
      pkgs,
      ...
    }:
    {
      programs.fresh-editor = {
        enable = true;
        defaultEditor = true;
      };

      programs.neovim.enable = true;
      programs.vim.enable = true;

      # no home-manager module for nano
      home.packages = with pkgs; [
        nano
      ];

      xdg.configFile."nano/nanorc".text = ''
        set atblanks
        set autoindent
        set colonparsing
        set constantshow

        set indicator
        set scrollercolor white,lightblack

        set keycolor lightwhite,black

        set linenumbers
        set numbercolor italic,lightwhite,black

        set minibar
        set minicolor black,blue

        set mouse
        set nohelp

        set promptcolor black,green

        set smarthome
        set softwrap
        set tabsize 4
        set tabstospaces
      '';
    };
}
