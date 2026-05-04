{
  features.editor_neovim = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          neovim
        ];
      };
  };
}
