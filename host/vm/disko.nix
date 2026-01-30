{ config, lib, pkgs, ... }:

{
  disko.devices.disk.main.device = "/dev/sda";
}