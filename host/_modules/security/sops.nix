{
  pkgs,
  ...
}:

{
  sops = {
    age.keyFile = "/var/lib/sops-nix/keys.txt";
    defaultSopsFile = ../../../secrets.yaml;
  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
