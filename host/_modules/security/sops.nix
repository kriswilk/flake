{
  pkgs,
  ...
}:

{
  sops = {
    age.keyFile = "/var/lib/sops-nix/key.txt";
    defaultSopsFile = ../../../secrets.yaml;
  };

  environment.systemPackages = with pkgs; [
    age
    sops
  ];
}
