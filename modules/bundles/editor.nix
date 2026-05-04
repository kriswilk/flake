{
  features,
  ...
}:
{
  bundles.editor = {
    includes = [
      features.editor_nano
      features.editor_neovim
      features.editor_vim
    ];
  };
}
