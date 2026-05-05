{
  features.cad_pcb = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          # TODO: re-enable once cache populated
          # kicad
        ];
      };
  };
}
