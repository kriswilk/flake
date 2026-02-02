{ config, lib, pkgs, ... }:

let
  isDir = name: type: type == "directory";
    #type == "regular" && !lib.hasSuffix ".nix" name;
  
  assetDirs = lib.filterAttrs isDir (builtins.readDir ./.);

  dirLinks = lib.mapAttrs' (name: _: 
    lib.nameValuePair 
      "flake-assets/${name}"
      { source = ./${name}; }
  ) assetDirs;
in
{
  xdg.dataFile = dirLinks;
}
