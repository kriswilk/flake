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
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/guest/password".path;
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
    daniela = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/daniela/password".path;
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
    hugo = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/hugo/password".path;
      extraGroups = userGroups;
      shell = pkgs.fish;
    };
    kris = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/kris/password".path;
      extraGroups = userGroups ++ [ "wheel" ];
      shell = pkgs.fish;
    };
  };
in
{
  sops.secrets."users/guest/password".neededForUsers = true;
  sops.secrets."users/daniela/password".neededForUsers = true;
  sops.secrets."users/hugo/password".neededForUsers = true;
  sops.secrets."users/kris/password".neededForUsers = true;

  users = {
    mutableUsers = false;
    users = userList;
  };

  home-manager = {
    users = lib.mapAttrs (userName: userData: (userDir + "/${userName}")) userList;
  };
}
