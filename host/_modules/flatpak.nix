{ config, lib, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
  };
  # WIP: need to add flathub repo?
  # WIP: need to use nix-flatpak??
}