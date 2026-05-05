{
  features.utility_disk = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          fio
          smartmontools
        ];
      };
  };
}
