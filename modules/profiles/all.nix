{
  inputs,
  ...
}:
let
  nixos = inputs.self.modules.nixos;
  home = inputs.self.modules.homeManager;
in
{
  flake.modules.nixos.profiles-all.imports = with nixos; [
    profiles-standard

    devices-printers
    devices-scanners

    shares-fathoms
    shares-reefnet

    software-flatpak
    software-gaming
    software-utilities
  ];

  flake.modules.homeManager.profiles-all.imports = with home; [
    profiles-standard

    software-cad
    software-creative
    software-development
    software-flatpak
    software-gaming
  ];
}
