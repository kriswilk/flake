{
  features,
  ...
}:
{
  bundles.core = {
    includes = [
      features.disko
      features.environment
      features.nix
      features.sops
      features.stylix
    ];
  };
}
