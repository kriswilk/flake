{
  features,
  ...
}:
{
  bundles.terminal = {
    includes = [
      features.terminal_foot
      features.terminal_tmux
    ];
  };
}
