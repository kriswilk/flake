let
  # name:   user name; password secret is user/<name>/password
  # uid:    user id
  # groups: groups in addition to the common ones
  # home:   the user's home-manager module (imports, settings)
  mkUser =
    name:
    {
      uid,
      groups ? [ ],
      home ? { },
    }:
    {
      config,
      ...
    }:
    {
      sops.secrets."user/${name}/password".neededForUsers = true;

      users.users.${name} = {
        isNormalUser = true;
        inherit uid;
        hashedPasswordFile = config.sops.secrets."user/${name}/password".path;
        extraGroups = [
          "lp"
          "networkmanager"
          "scanner"
        ]
        ++ groups;
      };

      home-manager.users.${name} = home;
    };
in
{
  _module.args.mkUser = mkUser;
}
