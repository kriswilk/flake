{
  config,
  lib,
  pkgs,
  userDir,
  ...
}:

let
  userGroups = [
    "lp"
    "networkmanager"
    "scanner"
  ];
  userList = {
    guest = {
      uid = 1000;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user/guest/password".path;
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
    kris = {
      uid = 1001;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user/kris/password".path;
      extraGroups = userGroups ++ [
        "wheel"
        "share"
      ];
      shell = pkgs.fish;
    };
    daniela = {
      uid = 1002;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user/daniela/password".path;
      extraGroups = userGroups ++ [
        "share"
      ];
      shell = pkgs.fish;
    };
    hugo = {
      uid = 1003;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."user/hugo/password".path;
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
  };
  groupList = {
    share = {
      gid = 101;
    };
  };
in
{
  users = {
    mutableUsers = false;
    users = userList;
    groups = groupList;
  };

  home-manager = {
    users = lib.mapAttrs (userName: userData: (userDir + "/${userName}")) userList;
  };
}
