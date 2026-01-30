{ config, lib, pkgs, ... }:

{
  programs.git = {
    settings.user.name = "Kris Wilk";
    settings.user.email = "kris@reefnet.ca";
  };
}