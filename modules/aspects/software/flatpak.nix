{
  inputs,
  ...
}:
let
  remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
    {
      name = "artcraft-oci";
      location = "https://getartcraft.com/artcraft-oci.flatpakrepo";
    }
  ];
in
{
  flake.modules.nixos.software-flatpak = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;
      inherit remotes;
    };
  };

  flake.modules.homeManager.software-flatpak = {
    imports = [
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ];

    services.flatpak = {
      inherit remotes;
    };
  };
}
