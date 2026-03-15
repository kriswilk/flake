{
  pkgs,
  ...
}:

{
  sops = {
    age.keyFile = "/home/kris/.config/sops/age/keys.txt";
    defaultSopsFile = ../../../secrets.yaml;
  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
