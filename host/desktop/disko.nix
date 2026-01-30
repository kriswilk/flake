{ config, lib, pkgs, ... }:

{
  disko.devices.disk.main.device = "/dev/nvme0n1";
}