{
  features.core_flatpak = {
    nixos = {
      services.flatpak = {
        enable = true;
      };
      # WIP: need to add flathub repo?
      # WIP: need to use nix-flatpak??
    };
  };
}
