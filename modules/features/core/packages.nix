{
  features.core_packages = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        environment.systemPackages = with pkgs; [
          curl
          git
          wget
        ];
      };
  };
}
