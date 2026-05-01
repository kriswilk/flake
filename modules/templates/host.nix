{
  bundles,
  den,
  groups,
  ...
}:
{
  templates.host = {
    includes = [
      den._.hostname
      groups.share

      bundles.core

      bundles.browser
      bundles.desktop
      bundles.shell

      den.aspects.legacy
    ];
  };
}
