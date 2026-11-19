{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-hugo = mkUser "hugo" {
    uid = 1003;
    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-all
      ];
    };
  };
}
