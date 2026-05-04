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
      bundles.editor
      bundles.shell
      bundles.terminal

      den.aspects.legacy
    ];
  };
}
