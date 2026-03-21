{
  config,
  lib,
  pkgs,
  ...
}:

with config.lib.stylix.colors.withHashtag;
{
  programs.fd = {
    enable = true;
  };

  stylix.targets.fzf.enable = true;

  programs.fzf = {
    enable = true;
    colors = {
      pointer = lib.mkForce blue;
      marker = lib.mkForce base04;
      prompt = lib.mkForce green;
      info = lib.mkForce base04;
    };
    defaultOptions = [
      "--layout=reverse"
      "--info=inline-right"
      "--highlight-line"
      "--bind=change:top"
    ];
  };

  stylix.targets.yazi.enable = true;

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
    settings = {
      mgr = {
        ratio = [
          1
          1
          2
        ];
      };
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

    bcompare
    krename
    nemo
    qbittorrent
  ];
}
