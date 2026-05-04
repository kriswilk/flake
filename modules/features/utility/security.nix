{
  features.utility_security = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          gnupg
        ];
      };
  };
}
