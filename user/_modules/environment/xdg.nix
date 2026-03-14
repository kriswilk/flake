{
  ...
}:

{
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "google-chrome.desktop";
        "text/html" = "google-chrome.desktop";
        "x-scheme-handler/http" = "google-chrome.desktop";
        "x-scheme-handler/https" = "google-chrome.desktop";
        "x-scheme-handler/about" = "google-chrome.desktop";
        "x-scheme-handler/unknown" = "google-chrome.desktop";
      };
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "footclient.desktop" ];
      };
    };
  };
}
