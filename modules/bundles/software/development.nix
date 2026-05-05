{
  features,
  ...
}:
{
  bundles.development = {
    includes = [
      features.development_ide
      features.development_language
      features.development_version
    ];
  };
}
