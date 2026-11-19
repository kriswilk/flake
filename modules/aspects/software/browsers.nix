{
  flake.modules.homeManager.software-browsers =
    {
      pkgs,
      ...
    }:
    {
      programs.chromium = {
        enable = true;
        package = pkgs.google-chrome;
      };
    };
}
