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
