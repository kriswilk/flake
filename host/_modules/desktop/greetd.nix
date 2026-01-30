{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
          --time --time-format '%a, %b %d %Y • %T' \
          --width 50 --window-padding 1 --container-padding 2 \
          --theme 'container=black;border=gray;title=yellow;greet=blue;text=gray;prompt=white;input=gray;time=white;action=blue;button=yellow' \
          --asterisks \
        '';
        user = "greeter";
      };
    };
  };
}