{
  features,
  ...
}:
{
  bundles.filesystem = {
    includes = [
      features.filesystem_fathoms
      features.filesystem_reefnet
    ];
  };
}
