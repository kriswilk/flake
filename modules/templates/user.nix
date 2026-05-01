{
  bundles,
  den,
  features,
  ...
}:
{
  templates.user = {
    includes = [
      den._.define-user
      (den._.user-shell "fish")

      features.nix-index

      bundles.core
      bundles.shell

      den.aspects.legacy
    ];
  };
}
