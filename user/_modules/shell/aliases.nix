{ config, lib, pkgs, ... }:

{
  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    l = "ls -l";
    ll = "ls -alh";
  };
}