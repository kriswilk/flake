{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    themes = {
      url = "github:kriswilk/themes";
      flake = false;
    };
  };

  features.stylix = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.stylix.nixosModules.stylix
        ];

        stylix = {
          enable = true;
          autoEnable = false;

          base16Scheme = "${inputs.themes}/kanagawa/base16/kanagawa-wave-neutral-oled.yaml";

          fonts = {
            serif = {
              package = pkgs.noto-fonts;
              name = "Noto Serif";
            };
            sansSerif = {
              package = pkgs.noto-fonts;
              name = "Noto Sans";
            };
            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrainsMonoNL Nerd Font";
            };
            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };
            sizes = {
              applications = 10;
              desktop = 10;
              popups = 10;
              terminal = 12;
            };
          };

          targets = {
            console.enable = true;
            fish.enable = true;
            font-packages.enable = true;
            fontconfig.enable = true;
          };
        };
      };

    homeManager = {
      stylix = {
        targets = {
          btop.enable = true;
          fish.enable = true;
          font-packages.enable = true;
          fontconfig.enable = true;
          foot.enable = true;
          fzf.enable = true;
          lazygit.enable = true;
          mpv.enable = true;
          starship.enable = true;
          tmux.enable = true;
          yazi.enable = true;
        };
      };
    };
  };
}
