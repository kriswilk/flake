{
  features.cad_3d = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          blender
          freecad
          prusa-slicer
        ];
      };
  };
}
