{
  bundles,
  den,
  ...
}:
{
  templates.host = {
    includes = [
      den._.hostname

      bundles.core
      bundles.filesystem
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
