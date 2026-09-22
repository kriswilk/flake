{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  features.core_theme = {
    nixos = {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        autoEnable = false;
        cache.enable = true;

        fish.enable = true;
        tty.enable = true;
      };
    };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.catppuccin.homeModules.catppuccin
        ];

        catppuccin = {
          enable = true;
          autoEnable = false;
          cache.enable = true;

          btop.enable = true;
          fish.enable = true;
          foot.enable = true;
          fzf.enable = true;
          lazygit.enable = true;
          lsd.enable = true;
          mpv.enable = true;
          starship.enable = true;
          tmux.enable = true;
          yazi.enable = true;
        };

        # catppuccin/nix doesn't support konsole yet, so we need to fetch the colorscheme manually
        xdg.dataFile."konsole/Catppuccin.colorscheme".source = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/konsole/main/themes/catppuccin-mocha.colorscheme";
          sha256 = "sha256-apsWpYLpmBQdbZCNo7h6wXK3eB9HtBkoJ3P3DReAB28=";
        };
      };
  };
}
