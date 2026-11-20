{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-guest = mkUser "guest" {
    uid = 1000;
    groups = [ ];

    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-standard
      ];
    };
  };
}
