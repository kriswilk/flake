{ config, lib, pkgs, ... }:

let
  isDir = name: type: type == "directory";
  
  assetDirs = lib.filterAttrs isDir (builtins.readDir ./.);

  dirLinks = lib.mapAttrs' (name: _: 
    lib.nameValuePair 
      "flake-asset/${name}"
      { source = ./${name}; }
  ) assetDirs;
in
{
  xdg.dataFile = dirLinks;
}
