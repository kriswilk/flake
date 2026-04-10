{
  flake.nixosModules.cowsay =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        cowsay
      ];
    };

  # flake.modules.homeManager.terminal = { ... }: {
  #   home.shellAliases = { gs = "git status"; };
  #   # ... other user level stuff
  # };
}
