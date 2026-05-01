{
  features,
  ...
}:
{
  bundles.core = {
    includes = [
      features.sops
      features.stylix

      features.audio
      features.bluetooth
      features.gaming
      features.network
      features.nix
      features.print
      features.scan
      features.variables
    ];
  };
}
