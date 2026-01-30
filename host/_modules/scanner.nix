{ config, lib, pkgs, ... }:

{
  # WIP: needs testing/config
  hardware.sane = {
    enable = true;
    brscan4 = {
      enable = true;
      netDevices = {
        "fathoms-daniela" = {
          ip = "10.0.0.203";
          model = "DCP-7065DN";
        };
      };
    };
  };
}