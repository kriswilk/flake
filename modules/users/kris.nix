{
  inputs,
  mkUser,
  ...
}:
{
  flake.modules.nixos.users-kris = mkUser "kris" {
    uid = 1001;
    groups = [
      "wheel"
      "fathoms"
      "reefnet"
    ];

    home = {
      imports = [
        inputs.self.modules.homeManager.profiles-all
      ];

      programs.git = {
        settings.user.name = "Kris Wilk";
        settings.user.email = "kris@reefnet.ca";
      };
    };
  };
}
