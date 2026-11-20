let
  commonAliases = {
    e = "$EDITOR";
  };
in
{
  flake.modules.nixos.core-aliases = {
    environment.shellAliases = commonAliases;
  };

  flake.modules.homeManager.core-aliases = {
    home.shellAliases = commonAliases;
  };
}
