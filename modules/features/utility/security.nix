{
  features.utility_security = {
    nixos = {
      programs._1password = {
        enable = true;
      };

      programs._1password-gui = {
        enable = true;
      };
    };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          gnupg
        ];
      };
  };
}
