{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    neovim

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
