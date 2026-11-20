{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-daniela = mkUser "daniela" {
    uid = 1002;
    groups = [ ];

    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-all
      ];
    };
  };
}
