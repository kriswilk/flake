{
  features,
  ...
}:
{
  bundles.gaming = {
    includes = [
      features.gaming_steam

      features.gaming_minecraft
      features.gaming_puzzles
    ];
  };
}
