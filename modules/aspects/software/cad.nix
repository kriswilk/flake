{
  flake.modules.homeManager.software-cad =
    {
      pkgs,
      ...
    }:
    {
      home.packages = with pkgs; [
        # 3D
        blender
        freecad
        prusa-slicer

        # PCB
        # TODO: re-enable once cache populated
        # kicad
      ];
    };
}
