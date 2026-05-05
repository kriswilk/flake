{
  features.gaming_minecraft = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          prismlauncher
        ];
      };
  };
}
