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

      den.aspects.legacy
    ];
  };
}
