{
  inputs,
  ...
}:
{
  flake.modules.nixos.core-desktop = {
    services.desktopManager.plasma6.enable = true;
    services.displayManager.plasma-login-manager.enable = true;
  };

  flake.modules.homeManager.core-desktop = {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];

    programs.plasma = {
      enable = true;

      fonts = {
        general = {
          family = "sans-serif";
          pointSize = 10;
        };
        fixedWidth = {
          family = "monospace";
          pointSize = 10;
        };
        menu = {
          family = "sans-serif";
          pointSize = 10;
        };
        small = {
          family = "sans-serif";
          pointSize = 8;
        };
        toolbar = {
          family = "sans-serif";
          pointSize = 10;
        };
        windowTitle = {
          family = "sans-serif";
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
          name = "monospace";
          size = 10;
        };
      };
    };
  };
}
