{
  features.utility_text = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.jq = {
          enable = true;
        };

        programs.pandoc = {
          enable = true;
        };

        programs.ripgrep = {
          enable = true;
        };

        home.packages = with pkgs; [
          calibre
          gawk
          gnugrep
          gnused
          poppler
          yq
        ];
      };
  };
}
