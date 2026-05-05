{
  features.editor_vim = {
    nixos = {
      programs.vim = {
        enable = true;
      };
    };

    homeManager = {
      programs.vim = {
        enable = true;
      };
    };
  };
}
