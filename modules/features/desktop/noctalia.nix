{
  features.desktop_noctalia = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = with pkgs; [
          noctalia-shell
        ];
      };
  };
}
