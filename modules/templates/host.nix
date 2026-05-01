{
  den,
  features,
  groups,
  ...
}:
{
  templates.host = {
    includes = [
      den._.hostname

      groups.share

      features.disko
      features.sops
      features.stylix
      features.variables

      features.audio
      features.bluetooth
      features.gaming
      features.network
      features.nix
      features.print
      features.scan

      den.aspects.legacy
    ];
  };
}
