let
  # name:   share name; mounted at /mnt/<name>, with a sops secret share/<name>
  #         holding the credentials and a group <name> owning the files
  # gid:    gid of the group
  # device: //server/share path
  mkShare =
    name:
    {
      gid,
      device,
    }:
    {
      config,
      ...
    }:
    {
      sops.secrets."share/${name}" = { };

      users.groups.${name} = {
        inherit gid;
      };

      fileSystems."/mnt/${name}" = {
        inherit device;
        fsType = "cifs";
        options = [
          # authentication
          "credentials=${config.sops.secrets."share/${name}".path}"

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
in
{
  # makes mkShare available as a module argument
  _module.args.mkShare = mkShare;
}
