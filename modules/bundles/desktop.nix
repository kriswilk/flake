{
  features,
  ...
}:
{
  bundles.desktop = {
    includes = [
      features.desktop_greetd
      features.desktop_niri
      features.desktop_noctalia
    ];
  };
}
