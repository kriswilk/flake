{
  features,
  ...
}:
{
  bundles.utility = {
    includes = [
      features.utility_archive
      features.utility_calculator
      features.utility_disk
      features.utility_file
      features.utility_security
      features.utility_system
      features.utility_text
    ];
  };
}
