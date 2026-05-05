{
  inputs,
  ...
}:
{
  imports = [
    (inputs.den.namespace "bundles" false)
    (inputs.den.namespace "features" false)
    (inputs.den.namespace "templates" false)
  ];
}
