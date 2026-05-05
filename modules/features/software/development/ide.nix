{
  features.development_ide = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.vscode = {
          enable = true;

          profiles.default.extensions = with pkgs.vscode-extensions; [
            bradlc.vscode-tailwindcss
            charliermarsh.ruff
            dotjoshjohnson.xml
            esbenp.prettier-vscode
            github.copilot
            github.copilot-chat
            jnoortheen.nix-ide
            marus25.cortex-debug
            ms-python.python
            ms-vscode.cpptools
            ms-vscode.powershell
            ms-vscode-remote.vscode-remote-extensionpack
            pkief.material-icon-theme
            timonwong.shellcheck
            tyriar.sort-lines
          ];
        };
      };
  };
}
