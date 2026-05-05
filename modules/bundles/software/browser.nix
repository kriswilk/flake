{
  features,
  ...
}:
{
  bundles.browser = {
    includes = [
      features.browser_chrome
      # features.browser_firefox
      features.browser_lynx
    ];
  };
}
