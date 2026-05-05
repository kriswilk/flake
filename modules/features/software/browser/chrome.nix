{
  features.browser_chrome = {
    homeManager =
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
  };
}
