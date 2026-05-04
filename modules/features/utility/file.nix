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
            color.theme = "custom";
            date = "+%Y-%m-%d %H:%M";
            icons.when = "never";
            sorting.dir-grouping = "first";
          };

          colors = {
            user = base06;
            group = base04;
            date = {
              hour-old = base07;
              day-old = base05;
              older = base03;
            };
            size = {
              none = base03;
              large = base07;
              medium = base05;
              small = base03;
            };
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
          krename
          nemo
          qbittorrent
        ];
      };
  };
}
