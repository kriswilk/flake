{
  features,
  ...
}:
{
  bundles.cad = {
    includes = [
      features.cad_3d
      features.cad_pcb
    ];
  };
}
