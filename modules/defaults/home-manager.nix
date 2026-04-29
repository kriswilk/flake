{
  lib,
  ...
}:
{
  den.default = {
    nixos = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    };
    homeManager = {
      home.stateVersion = "26.05";
    };
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
