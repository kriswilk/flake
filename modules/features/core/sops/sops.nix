{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  features.core_sops = {
    nixos =
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
          defaultSopsFile = ./secrets.yaml;

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
            "share/reefnet" = { };
          };
        };

        environment.sessionVariables = {
          SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
        };

        environment.systemPackages = with pkgs; [
          age
          sops
        ];
      };

    homeManager = {
      imports = [
        inputs.sops-nix.homeManagerModules.sops
      ];
    };
  };
}
