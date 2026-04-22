{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    noctalia-shell
  ];
}
