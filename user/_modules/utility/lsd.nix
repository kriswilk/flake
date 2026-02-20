{
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;
{
  programs.lsd = {
    enable = true;

    settings = {
      blocks = [
        "permission"
        "user"
        "group"
        "size"
        "date"
        "git"
        "name"
      ];
      color.theme = "custom";
      date = "+%Y-%m-%d %H:%M";
      icons.when = "never";
      sorting.dir-grouping = "first";
    };

    colors = {
      user = base06;
      group = base04;
      date = {
        hour-old = base07;
        day-old = base05;
        older = base03;
      };
      size = {
        none = base03;
        large = base07;
        medium = base05;
        small = base03;
      };
    };
  };
}
