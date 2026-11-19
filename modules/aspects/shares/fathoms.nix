{
  mkShare,
  ...
}:
{
  flake.modules.nixos.shares-fathoms = mkShare "fathoms" {
    gid = 101;
    device = "//desktop-kris/Y";
  };
}
