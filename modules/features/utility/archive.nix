{
  features.utility_archive = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          p7zip
          unzip
          zip
        ];
      };
  };
}
