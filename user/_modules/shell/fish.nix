{
  ...
}:

{
  stylix.targets.fish.enable = true;

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
}
