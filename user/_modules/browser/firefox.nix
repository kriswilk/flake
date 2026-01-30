{ inputs, config, lib, pkgs, ... }:

{
  stylix.targets.firefox = {
    profileNames = [ "default" ];
  };

  # WIP: still need to fine tune preferences, incl. UI arrangement??
  programs.firefox = {
    enable = true;
    profiles."default".settings = {
      # sidebar cannot be configured by policy
      "sidebar.revamp" = true;
      "sidebar.main.tools" = "aichat,history,{446900e4-71c2-419f-a6a7-df9c091e268b},jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack";
    };
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
      DisableFormHistory = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";

      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
        };
        
        # augmented steam          
        "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/augmented-steam/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # keepa
        "amptra@keepa.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepa/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # raindrop.io
        "jid0-adyhmvsP91nUO8pRv0Mn2VKeB84@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/raindropio/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # sponsorblock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };

        # ublock-origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "navbar";
        };

        # web edit
        "webedit@ryanluu.dev" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/web-edit/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        Stories = false;
        SponsoredPocket = false;
        SpomoredStories = false;
        Snippets = false;
        Locked = true;
      };

      FirefoxSuggest = {
        WebSuggestions = true;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };

      GenerativeAI = {
        Enabled = false;
        Chatbot = true;
        LinkPreviews = false;
        TabGroups = false;
        Locked = true;
      };

      Homepage = {
        URL = "about:blank";
        StartPage = "none";
        Locked = true;
      };
      
      HttpsOnlyMode = "force_enabled";
      NewTabPage = false;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;

      Preferences = {
        "browser.ml.linkPreview.enabled" = false;

        # ui customization
        "browser.download.autohideButton" = false;
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            widget-overflow-fixed-list = [];
            unified-extensions-area = [];
            nav-bar = [
              "sidebar-button"
              "back-button"
              "forward-button"
              "stop-reload-button"
              "urlbar-container"
              
              "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
              "ublock0_raymondhill_net-browser-action"
              "sponsorblocker_ajay_app-browser-action"
              "amptra_keepa_com-browser-action"
              "webedit_ryanluu_dev-browser-action"
              
              "unified-extensions-button"
              "downloads-button"
            ];
            toolbar-menubar = [
              "menubar-items"
            ];
            TabsToolbar = [
              "firefox-view-button"
              "tabbrowser-tabs"
              "new-tab-button"
            ];
            vertical-tabs = [];
            PersonalToolbar = [
              "personal-bookmarks" 
            ];
          };
          # WIP: not sure if any of this is needed....
          # seen = [
          #   "developer-button"
          #   "screenshot-button"
          #   "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
          #   "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
          #   "ublock0_raymondhill_net-browser-action"
          #   "sponsorblocker_ajay_app-browser-action"
          #   "amptra_keepa_com-browser-action"
          #   "webedit_ryanluu_dev-browser-action"
          # ];
          # dirtyAreaCache = [
          #   "unified-extensions-area"
          #   "nav-bar"
          #   "vertical-tabs"
          # ];
          currentVersion = 23;
          newElementCount = 1;
        };

        # enable container tabs
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
      };

      SearchEngines.Add = [
        {
          Name = "Docker Hub";
          Alias = "@dh";
          URLTemplate = "https://hub.docker.com/search?q={searchTerms}";
          IconURL = "https://hub.docker.com/favicon.ico";
        }
        {
          Name = "Flathub";
          Alias = "@fh";
          URLTemplate = "https://flathub.org/apps/search?q={searchTerms}";
          IconURL = "https://flathub.org/favicon.png";
        }
        {
          Name = "GitHub";
          Alias = "@gh";
          URLTemplate = "https://github.com/search?q={searchTerms}";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "GitHub Nix";
          Alias = "@gn";
          URLTemplate = "https://github.com/search?q=language%3Anix+{searchTerms}&type=code";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "Home Manager";
          Alias = "@hm";
          URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}";
          IconURL = "https://home-manager-options.extranix.com/images/favicon.png";
        }
        {
          Name = "Nix Packages";
          Alias = "@np";
          URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
          IconURL = "https://search.nixos.org/favicon.ico";
        }
        {
          Name = "Nix Options";
          Alias = "@no";
          URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
          IconURL = "https://search.nixos.org/favicon.ico";
        }
       {
          Name = "NixOS Wiki";
          Alias = "@nw";
          URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
          IconURL = "https://wiki.nixos.org/favicon.ico";
        }
        {
          Name = "Reddit";
          Alias = "@reddit";
          URLTemplate = "https://www.reddit.com/search/?q={searchTerms}";
          IconURL = "https://www.reddit.com/favicon.ico";
        }
        {
          Name = "Stack Overflow";
          Alias = "@so";
          URLTemplate = "https://stackoverflow.com/search?q={searchTerms}";
          IconURL = "https://stackoverflow.com/favicon.ico";
        }
        {
          Name = "YouTube";
          Alias = "@yt";
          URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
          IconURL = "https://www.youtube.com/favicon.ico";
        }
      ];

      ShowHomeButton = false;
      SkipTermsOfUse = true;

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        FirefoxLabs = false;
        MoreFromMozilla = false;
        SkipOnboarding = true;
        UrlbarInterventions = false;
        WhatsNew = false;
        Locked = true;
      };
    };
  };
}