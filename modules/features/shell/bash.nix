{
  features.shell_bash = {
    nixos = {
      programs.bash = {
        enable = true;
      };
    };

    homeManager = {
      programs.bash = {
        enable = true;
      };
    };
  };
}
