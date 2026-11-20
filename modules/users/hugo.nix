{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-hugo = mkUser "hugo" {
    uid = 1003;
    groups = [ ];

    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-all
      ];
    };
  };
}
