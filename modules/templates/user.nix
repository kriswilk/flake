{
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
      features.sops
      features.stylix

      features.variables

      den.aspects.legacy
    ];
  };
}
