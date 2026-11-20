{
  flake.modules.nixos.core-shells =
    {
      pkgs,
      ...
    }:
    {
      programs.fish.enable = true;
      users.defaultUserShell = pkgs.fish;

      documentation.man.cache.enable = false;
    };

  flake.modules.homeManager.core-shells = {
    programs.bash.enable = true;

    programs.fish = {
      enable = true;

      functions = {
        # always reset the cursor to a solid vertical line
        reset_cursor = {
          body = ''
            printf '\e[6 q'
          '';
          onEvent = "fish_prompt";
        };
      };
    };

    programs.man.generateCaches = false;
  };
}
