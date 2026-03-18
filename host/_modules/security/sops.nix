{
  config,
  pkgs,
  ...
}:

{
  sops = {
    age.keyFile = "/var/lib/age/keys.txt";
    defaultSopsFile = ../../../secrets.yaml;

    secrets = {
      "user/guest/password" = {
        neededForUsers = true;
      };
      "user/daniela/password" = {
        neededForUsers = true;
      };
      "user/hugo/password" = {
        neededForUsers = true;
      };
      "user/kris/password" = {
        neededForUsers = true;
      };

      "share/fathoms" = { };
    };
  };

  environment.sessionVariables = {
    SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
