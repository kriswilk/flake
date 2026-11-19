{
  flake.modules.nixos.core-locale = {
    time.timeZone = "America/Toronto";
    i18n.defaultLocale = "en_CA.UTF-8";
  };
}
