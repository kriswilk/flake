{
  templates,
  ...
}:
{
  den.aspects.hugo = {
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
        users.users.hugo = {
          uid = 1003;
          hashedPasswordFile = config.sops.secrets."user/hugo/password".path;
          extraGroups = [
            "lp"
            "networkmanager"
            "scanner"
          ];
        };
      };
  };
}
