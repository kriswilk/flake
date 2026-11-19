{
  flake.modules.homeManager.software-development =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        # IDE
        vscode-fhs

        # language tooling
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

      programs.direnv.enable = true;
    };
}
