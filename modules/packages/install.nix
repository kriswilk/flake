{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    {
      packages.install = pkgs.writeShellApplication {
        name = "install";

        runtimeInputs =
          with pkgs;
          [
            age
            fzf
            git
            nixos-install-tools
            util-linux
          ]
          ++ [ inputs.disko.packages.${system}.default ];

        text = ''
          HOSTS=(${pkgs.lib.escapeShellArgs (builtins.attrNames inputs.self.nixosConfigurations)})
          ${builtins.readFile ./install.sh}
        '';
      };
    };
}
