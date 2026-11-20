{
  inputs,
  ...
}:
let
  nixos = inputs.self.modules.nixos;

  # name:  host name; the host module is nixos.hosts-<name>
  # users: users to create; each has a nixos.users-<user> module
  mkHost =
    name:
    {
      users,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.home-manager.nixosModules.home-manager
        nixos."hosts-${name}"
        {
          networking.hostName = name;
          system.stateVersion = "26.05";

          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [
              { home.stateVersion = "26.05"; }
            ];
          };
        }
      ]
      ++ map (u: nixos."users-${u}") users;
    };
in
{
  _module.args.mkHost = mkHost;
}
