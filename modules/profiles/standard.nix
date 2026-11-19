{
  inputs,
  ...
}:
let
  nixos = inputs.self.modules.nixos;
  home = inputs.self.modules.homeManager;
in
{
  flake.modules.nixos.profiles-standard.imports = with nixos; [
    core-bootloader
    core-desktop
    core-disko
    core-editors
    core-fonts
    core-git
    core-locale
    core-nix
    core-shells
    core-sops
    core-swap
    core-theme
    core-tools

    hardware-audio
    hardware-bluetooth
    hardware-graphics
    hardware-network
    hardware-power
  ];

  flake.modules.homeManager.profiles-standard.imports = with home; [
    core-desktop
    core-editors
    core-git
    core-nix
    core-prompt
    core-shells
    core-theme
    core-tools

    hardware-network

    software-browsers
    software-terminal
    software-utilities
  ];
}
