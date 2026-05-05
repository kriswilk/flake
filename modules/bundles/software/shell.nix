{
  features,
  ...
}:
{
  bundles.shell = {
    includes = [
      features.shell_bash
      features.shell_direnv
      features.shell_fish
      features.shell_starship
    ];
  };
}
