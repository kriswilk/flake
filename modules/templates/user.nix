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

      den.aspects.legacy
    ];
  };
}
