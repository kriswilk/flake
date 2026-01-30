{ config, lib, pkgs, ... }:

{
  imports = [
    ../_modules
  ] ++ lib.fileset.toList (
    lib.fileset.fileFilter (file: file.hasExt "nix" && file.name != "default.nix") ./.
  );
}