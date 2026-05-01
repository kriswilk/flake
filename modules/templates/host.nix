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

      den.aspects.legacy
    ];
  };
}
