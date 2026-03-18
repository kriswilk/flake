{
  config,
  pkgs,
  ...
}:

{
  fileSystems."/mnt/fathoms" = {
    device = "//desktop-kris/Y";
    fsType = "cifs";
    options = [
      # authentication
      "credentials=${config.sops.secrets."share/fathoms".path}"

      # permissions
      "uid=0"
      "gid=${toString config.users.groups.share.gid}"
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

  environment.systemPackages = with pkgs; [
    cifs-utils
  ];
}
