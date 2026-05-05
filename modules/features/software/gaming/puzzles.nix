{
  features.gaming_puzzles = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          sgt-puzzles
        ];
      };
  };
}
