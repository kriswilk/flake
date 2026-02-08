{ config, lib, pkgs, ... }:

let
  scriptFiles = lib.filterAttrs
    (name: type: type == "regular" && !(lib.hasSuffix ".nix" name))
    (builtins.readDir ./.);

  mkScript = name: type: pkgs.writeShellScriptBin name (builtins.readFile ./${name});

  scriptPackages = lib.mapAttrsToList mkScript scriptFiles;
in
{
  home.packages = scriptPackages;
}
