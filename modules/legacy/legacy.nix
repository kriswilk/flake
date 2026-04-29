{
  inputs,
  ...
}:
{
  den.aspects.legacy = {
    nixos = {
      imports = [ (inputs.import-tree ./_nixos) ];
    };

    homeManager = {
      imports = [ (inputs.import-tree ./_homeManager) ];
    };
  };
}
