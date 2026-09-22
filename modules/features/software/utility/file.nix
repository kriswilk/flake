{
  features.utility_file = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = with pkgs; [
          curl
          git
          wget
        ];
      };

    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.fd = {
          enable = true;
        };

        programs.fzf = {
          enable = true;
          defaultOptions = [
            "--layout=reverse"
            "--info=inline-right"
            "--highlight-line"
            "--bind=change:top"
          ];
        };

        programs.lsd = {
          enable = true;
          settings = {
            blocks = [
              "permission"
              "user"
              "group"
              "size"
              "date"
              "git"
              "name"
            ];
            date = "+%Y-%m-%d %H:%M";
            icons.when = "never";
            sorting.dir-grouping = "first";
          };
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
          qbittorrent
        ];
      };
  };
}
