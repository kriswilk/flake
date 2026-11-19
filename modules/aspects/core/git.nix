{
  flake.modules.nixos.core-git = {
    programs.git.enable = true;
  };

  flake.modules.homeManager.core-git = {
    programs.gh.enable = true;
    programs.git.enable = true;
    programs.lazygit.enable = true;
  };
}
