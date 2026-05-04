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
      bundles.hardware

      bundles.browser
      bundles.desktop
      bundles.editor
      bundles.gaming
      bundles.multimedia
      bundles.shell
      bundles.terminal
      bundles.utility

      den.aspects.legacy
    ];
  };
}
