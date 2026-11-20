let
  # name:    share name; mounted at /mnt/<name>, with a sops secret share/<name>
  #          holding the credentials and a group <name> owning the files
  # gid:     gid of the group
  # device:  //server/share path
  # members: users allowed to access the share (membership lives here, so hosts
  #          without the share never reference its group)
  mkShare =
    name:
    {
      gid,
      device,
      members ? [ ],
    }:
    {
      config,
      ...
    }:
    {
      sops.secrets."share/${name}" = { };

      users.groups.${name} = {
        inherit gid members;
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
  _module.args.mkShare = mkShare;
}
