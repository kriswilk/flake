{
  features.desktop_kde = {
    nixos = {
      services.desktopManager.plasma6.enable = true;
      services.displayManager.plasma-login-manager.enable = true;
    };
  };
}
