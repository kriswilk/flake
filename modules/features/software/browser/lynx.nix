{
  features.browser_lynx = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          lynx
        ];
      };
  };
}
