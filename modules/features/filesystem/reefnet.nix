let
  gid = 102;
in
{
  features.filesystem_reefnet = {
    nixos =
      {
        config,
        ...
      }:
      {
        users.groups.reefnet = {
          gid = gid;
        };

        fileSystems."/mnt/reefnet" = {
          device = "//desktop-reefnet/X";
          fsType = "cifs";
          options = [
            # authentication
            "credentials=${config.sops.secrets."share/reefnet".path}"

            # permissions
            "uid=0"
            "gid=${toString gid}"
            "file_mode=0660"
            "dir_mode=0770"

            # mount options
            "noauto"
            "x-systemd.automount"
            "x-systemd.requires=network-online.target"
            "x-systemd.mount-timeout=5s"
            "x-systemd.idle-timeout=60"
          ];
        };
      };
  };
}
