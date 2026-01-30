{ config, lib, pkgs, ... }:

{
  programs.fd = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    plugins = {
      smart-enter = pkgs.yaziPlugins.smart-enter;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "<Enter>";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
      ];
    };
  };

  programs.zoxide = {
    enable = true;
  };

  home.packages = with pkgs; [
    curl
    file
    rclone
    rsync
    tree
    wget

    nemo
    krename
    bcompare

    # WIP: kdePackages.ark # already installed?
    # WIP: kdePackages.filelight # already installed?
    # WIP: kdePackages.k3b # already installed?
    # WIP: onedrive, gdrive ?
    # WIP: qbittorrent
    # WIP: jdownloader2
  ];
}