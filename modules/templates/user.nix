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

      features.audio
      features.bluetooth
      features.gaming
      features.network
      features.nix
      features.print
      features.scan

      features.shell_bash
      features.shell_direnv
      features.shell_fish
      features.shell_starship

      den.aspects.legacy
    ];
  };
}
