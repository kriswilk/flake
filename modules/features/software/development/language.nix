{
  features.development_language = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          tree-sitter

          # bash
          shellcheck

          # C
          gcc
          gnumake

          # javascript, markdown
          prettier

          # kdl
          kdlfmt

          # lua
          lua-language-server
          stylua

          # nix
          nixd
          nixfmt

          # python
          basedpyright
          ruff

          # rust
          rustup
        ];
      };
  };
}
