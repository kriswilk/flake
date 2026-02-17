{ config, lib, pkgs, ... }:

{
  home.shellAliases = {
    # cd
    ".." = "cd ..";

    # ls
    ls = "ls --color=tty";
    l = "ls -lv --group-directories-first";
    ll = "ls -Alv --group-directories-first";
  };
}
