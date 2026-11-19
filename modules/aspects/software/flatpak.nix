{
  flake.modules.nixos.software-flatpak = {
    services.flatpak.enable = true;
    # WIP: need to add flathub repo?
    # WIP: need to use nix-flatpak??
  };
}
