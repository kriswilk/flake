{
  inputs,
  ...
}:
{
  flake.modules.nixos.core-theme = {
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

  flake.modules.homeManager.core-theme =
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
        starship.enable = true;
        tmux.enable = true;
        yazi.enable = true;
      };

      # catppuccin/nix doesn't support konsole yet, so we need to fetch the colorscheme manually
      xdg.dataFile."konsole/Catppuccin.colorscheme".source = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/catppuccin/konsole/main/themes/catppuccin-mocha.colorscheme";
        sha256 = "sha256-uHuVaYipMcR1qnR2nedrlXUNVlUQ2Ok5jGnq80sEvj8=";
      };
    };
}
