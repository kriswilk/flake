{
  bundles,
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

      bundles.core
      bundles.shell

      den.aspects.legacy
    ];
  };
}
