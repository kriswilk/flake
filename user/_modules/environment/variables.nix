{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "footclient";
    TERMINAL_FLOAT = "footclient --app-id='terminal-float'";
  };
}
