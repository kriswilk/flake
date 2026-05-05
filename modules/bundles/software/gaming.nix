{
  features,
  ...
}:
{
  bundles.gaming = {
    includes = [
      features.gaming_minecraft
      features.gaming_puzzles
      features.gaming_steam
    ];
  };
}
