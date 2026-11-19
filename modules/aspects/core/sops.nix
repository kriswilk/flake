{
  inputs,
  ...
}:
{
  flake.modules.nixos.core-sops =
    {
      config,
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        age.keyFile = "/var/lib/age/keys.txt";
        defaultSopsFile = ../../../secrets.yaml;
      };

      environment.sessionVariables = {
        SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
      };

      environment.systemPackages = with pkgs; [
        age
        sops
      ];
    };
}
