{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    (rofi.override {
      plugins = [
        rofi-calc
        rofi-emoji
        rofi-nerdy
      ];
    })
  ];

  xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  xdg.dataFile."rofi/themes/custom.rasi".source = ./theme.rasi;
}
