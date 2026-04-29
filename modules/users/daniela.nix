{
  templates,
  ...
}:
{
  den.aspects.daniela = {
    includes = [
      templates.user
      # den._.primary-user
    ];

    nixos =
      {
        config,
        ...
      }:
      {
        users.users.daniela = {
          uid = 1002;
          hashedPasswordFile = config.sops.secrets."user/daniela/password".path;
          extraGroups = [
            "lp"
            "networkmanager"
            "scanner"

            "share"
          ];
        };
      };
  };
}
