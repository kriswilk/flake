{
  bundles,
  den,
  ...
}:
{
  templates.host = {
    includes = [
      den._.hostname

      bundles.core
      bundles.desktop
      bundles.filesystem
      bundles.hardware
      bundles.software
    ];
  };
}
