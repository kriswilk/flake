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

      bundles.browser
      bundles.desktop
      bundles.shell

      den.aspects.legacy
    ];
  };
}
