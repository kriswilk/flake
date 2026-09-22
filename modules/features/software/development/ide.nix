{
  features.development_ide = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          vscode-fhs
        ];
      };
  };
}
