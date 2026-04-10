{
  flake.nixosModules.nixos = {
    system.stateVersion = "26.05";

    nix.settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };

    nixpkgs.config.allowUnfree = true;

    nix.optimise = {
      automatic = true;
      dates = [ "03:45" ];
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
