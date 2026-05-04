{
  features,
  ...
}:
{
  bundles.core = {
    includes = [
      features.core_bootloader
      features.core_disko
      features.core_environment
      features.core_flatpak
      features.core_font
      features.core_locale
      features.core_nix
      features.core_sops
      features.core_stylix
      features.core_swap
    ];
  };
}
