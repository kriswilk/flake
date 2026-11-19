{
  mkShare,
  ...
}:
{
  flake.modules.nixos.shares-reefnet = mkShare "reefnet" {
    gid = 102;
    device = "//desktop-reefnet/X";
  };
}
