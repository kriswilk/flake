{
  features.core_font = {
    nixos = 
    {
      pkgs,
      ...
    }:
    {
      fonts = {
          packages = with pkgs; [
            noto-fonts
            noto-fonts-color-emoji
            nerd-fonts.jetbrains-mono
          ];

          fontconfig = {
            defaultFonts = {
              serif = [ "Noto Serif" ];
              sansSerif = [ "Noto Sans" ];
              monospace = [ "JetBrainsMonoNL Nerd Font" ];
              emoji = [ "Noto Color Emoji" ];
            };
          };
        };
    };
  };
}
