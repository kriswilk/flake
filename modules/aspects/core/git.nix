let
  commonSettings = {
    diff.algorithm = "histogram";
    fetch.prune = true;
    init.defaultBranch = "main";
    merge.conflictStyle = "zdiff3";
    pull.rebase = true;
    push.autoSetupRemote = true;
    rerere.enabled = true;
  };
in
{
  flake.modules.nixos.core-git =
    {
      pkgs,
      ...
    }:
    {
      environment.systemPackages = [ pkgs.delta ];

      programs.git = {
        enable = true;
        config = commonSettings // {
          core.pager = "delta";
          interactive.diffFilter = "delta --color-only";

          # repo is root-owned but group-writable by wheel
          safe.directory = "/etc/nixos";
        };
      };
    };

  flake.modules.homeManager.core-git = {
    programs.gh.enable = true;
    programs.lazygit.enable = true;

    programs.delta = {
      enable = true;
      enableGitIntegration = true;
    };

    programs.git = {
      enable = true;
      settings = commonSettings;
    };
  };
}
