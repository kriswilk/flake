{
  pkgs,
  inputs,
  ...
}:

{
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = "${inputs.themes}/ekko/base16/ekko-dark.yaml";

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
      nvf.enable = true;
    };
  };
}
