{
  den,
  templates,
  ...
}:
{
  den.aspects.kris = {
    includes = [
      templates.user
      den._.primary-user
    ];

    nixos =
      {
        config,
        ...
      }:
      {
        users.users.kris = {
          uid = 1001;
          hashedPasswordFile = config.sops.secrets."user/kris/password".path;
          extraGroups = [
            "lp"
            "networkmanager"
            "scanner"

            "fathoms"
            "reefnet"
          ];
        };
      };

    homeManager = {
      programs.git = {
        settings.user.name = "Kris Wilk";
        settings.user.email = "kris@reefnet.ca";
      };
    };
  };
}
