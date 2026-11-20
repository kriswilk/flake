{
  flake.modules.nixos.hardware-network =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      # all normal users may manage connections
      users.groups.networkmanager.members = builtins.attrNames (
        lib.filterAttrs (_: user: user.isNormalUser) config.users.users
      );

      networking.networkmanager = {
        enable = true;
        wifi.backend = "iwd";
      };

      services.openssh.enable = true;
      services.tailscale.enable = true;

      environment.systemPackages = with pkgs; [
        cifs-utils
      ];
    };

  flake.modules.homeManager.hardware-network = {
    services.ssh-agent.enable = true;
  };
}
