{ config, lib, pkgs, ... }:

{
  home.sessionVariables = {
    FLAKE_ASSET = ./.;
  };
}
