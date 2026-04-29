{
  templates,
  ...
}:
{
  den.aspects.guest = {
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
        users.users.guest = {
          uid = 1000;
          hashedPasswordFile = config.sops.secrets."user/guest/password".path;
          extraGroups = [
            "lp"
            "networkmanager"
            "scanner"
          ];
        };
      };
  };
}
