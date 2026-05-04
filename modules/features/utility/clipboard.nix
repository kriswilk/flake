{
  features.utility_clipboard = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        services.cliphist = {
          enable = true;
        };

        home.packages = with pkgs; [
          wl-clipboard
          wtype
        ];
      };
  };
}
