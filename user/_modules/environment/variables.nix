{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "foot";
  };
}