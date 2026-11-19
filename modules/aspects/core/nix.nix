{
  inputs,
  ...
}:
{
  flake.modules.nixos.core-nix = {
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

  flake.modules.homeManager.core-nix =
    {
      pkgs,
      ...
    }:
    {
      imports = [
        inputs.nix-index-database.homeModules.default
      ];

      programs.nix-index.enable = true;
      programs.nix-index-database.comma.enable = true;

      programs.nh = {
        enable = true;
        flake = "/etc/nixos";
      };

      home.packages = with pkgs; [
        steam-run
      ];
    };
}
