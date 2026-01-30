{ config, lib, pkgs, ... }:

let
  isScript = name: type: 
    type == "regular" && lib.hasSuffix ".sh" name;
  
  scriptFiles = lib.filterAttrs isScript (builtins.readDir ./.);

  mkScript = name: _: 
    let
      binName = lib.removeSuffix ".sh" name;
    in
    pkgs.writeShellApplication {
      name = binName;
      text = builtins.readFile ./${name};
    };

  scriptPackages = lib.mapAttrsToList mkScript scriptFiles;
in
{
  home.packages = scriptPackages;
}