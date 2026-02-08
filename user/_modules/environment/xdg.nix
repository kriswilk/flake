{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;  
      defaultApplications = {
        "application/pdf" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
      };
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "footclient.desktop" ];
      };
    };
  };
}
