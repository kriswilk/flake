{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    neovim

    tree-sitter

    prettier

    lua-language-server
    stylua

    nixd
    nixfmt

    basedpyright
    ruff

    rustup
  ];
}
