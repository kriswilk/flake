{
  pkgs,
  ...
}:

{
  services.swayidle =
    let
      lock = "${pkgs.swaylock}/bin/swaylock -f";
    in
    {
      enable = true;

      timeouts = [
        {
          timeout = 300;
          command = lock;
        }
      ];

      events = {
        before-sleep = lock;
      };
    };
}
