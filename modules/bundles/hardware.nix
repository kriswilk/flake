{
  features,
  ...
}:
{
  bundles.hardware = {
    includes = [
      features.hardware_audio
      features.hardware_bluetooth
      features.hardware_network
      features.hardware_print
      features.hardware_scan
    ];
  };
}
