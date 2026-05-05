{
  features.productivity_office = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          libreoffice-fresh
        ];
      };
  };
}
