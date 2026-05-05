{
  features.utility_calculator = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          bc
          libqalculate
          qalculate-qt
        ];
      };
  };
}
