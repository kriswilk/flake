{
  bundles,
  den,
  ...
}:
{
  templates.user = {
    includes = [
      den._.define-user
      (den._.user-shell "fish")

      bundles.core
      bundles.desktop
      bundles.filesystem
      bundles.hardware
      bundles.software
    ];
  };
}
