{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  features.desktop_kde = {
    nixos = {
      services.desktopManager.plasma6.enable = true;
      services.displayManager.plasma-login-manager.enable = true;
    };

    homeManager = {
      imports = [
        inputs.plasma-manager.homeModules.plasma-manager
      ];

      programs.plasma = {
        enable = true;

        fonts = {
          general = {
            family = "Noto Sans";
            pointSize = 10;
          };
          fixedWidth = {
            family = "JetBrainsMonoNL Nerd Font";
            pointSize = 10;
          };
          menu = {
            family = "Noto Sans";
            pointSize = 10;
          };
          small = {
            family = "Noto Sans";
            pointSize = 8;
          };
          toolbar = {
            family = "Noto Sans";
            pointSize = 10;
          };
          windowTitle = {
            family = "Noto Sans";
            pointSize = 10;
            weight = "bold";
          };
        };
      };

      programs.konsole = {
        enable = true;
        defaultProfile = "Catppuccin";

        profiles."Catppuccin" = {
          colorScheme = "Catppuccin";
          font = {
            name = "JetBrainsMonoNL Nerd Font";
            size = 10;
          };
        };
      };
    };
  };
}
