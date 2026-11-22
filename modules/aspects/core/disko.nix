{
  inputs,
  ...
}:
{
  flake.modules.nixos.core-disko =
    {
      lib,
      ...
    }:
    {
      imports = [
        inputs.disko.nixosModules.disko
      ];

      disko.devices = {
        disk.main = {
          # the installer chooses the target disk and passes it in as DISKO_DEVICE (disko
          # evaluates impurely, so it can read it); the fallback is never used for formatting,
          # since the installed system refers to partitions by label, not by disk path
          device =
            let
              chosen = builtins.getEnv "DISKO_DEVICE";
            in
            lib.mkDefault (if chosen != "" then chosen else "/dev/null");
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                name = "ESP";
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypt";
                  settings = {
                    allowDiscards = true;
                  };
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
              };
            };
          };
        };
      };
    };
}
