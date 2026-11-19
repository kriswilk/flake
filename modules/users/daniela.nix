{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-daniela = mkUser "daniela" {
    uid = 1002;
    groups = [
      "fathoms"
    ];

    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-all
      ];
    };
  };
}
