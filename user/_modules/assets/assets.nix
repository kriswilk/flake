{ config, lib, pkgs, ... }:

let
  isAsset = name: type: 
    type == "regular" && !lib.hasSuffix ".nix" name;
  
  assetFiles = lib.filterAttrs isAsset (builtins.readDir ./.);

  assetLinks = lib.mapAttrs' (name: _: 
    lib.nameValuePair 
      "flake-assets/${name}"
      { source = ./${name}; }
  ) assetFiles;
in
{
  xdg.dataFile = assetLinks;
}