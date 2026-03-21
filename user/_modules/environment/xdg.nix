{
  ...
}:

{
  xdg = {
    enable = true;

    mimeApps = {
      enable = true;
      defaultApplications =
        let
          browser = "google-chrome.desktop";
          text = "org.kde.kwrite.desktop";
          document = "org.kde.okular.desktop";
          image = "imv.desktop";
          media = "mpv.desktop";
        in
        {
          # pdf
          "application/pdf" = browser;

          # browser
          "text/html" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/about" = browser;
          "x-scheme-handler/unknown" = browser;

          # text
          "application/json" = text;
          "application/xml" = text;
          "text/csv" = text;
          "text/markdown" = text;
          "text/plain" = text;
          "text/xml" = text;

          # document
          "application/epub+zip" = document;
          "application/x-cbr" = document;
          "application/x-cbz" = document;
          "image/vnd.djvu" = document;

          # image
          "image/bmp" = image;
          "image/gif" = image;
          "image/jpeg" = image;
          "image/png" = image;
          "image/svg+xml" = image;
          "image/tiff" = image;
          "image/webp" = image;

          # media
          "audio/mpeg" = media;
          "video/mp4" = media;
          "video/x-matroska" = media;
        };
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "com.mitchellh.ghostty.desktop" ];
      };
    };
  };
}
