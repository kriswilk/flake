{
  features.nix = {
    nixos = {
      nix.settings = {
        experimental-features = [
          "flakes"
          "nix-command"
        ];
      };

      nixpkgs.config.allowUnfree = true;

      nix.gc = {
        automatic = true;
        dates = [ "03:15" ];
        options = "--delete-older-than 10d";
      };

      nix.optimise = {
        automatic = true;
        dates = [ "03:45" ];
      };
    };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.nh = {
          enable = true;
        };

        home.packages = with pkgs; [
          steam-run
        ];
      };
  };
}
