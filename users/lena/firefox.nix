{ pkgs, gui-system, username, ... }:
let
  profiles.default = {
    id = 0;
    isDefault = true;
    name = "Default";
    settings = {
      "browser.ml.chat.enabled" = false;
      "browser.ml.chat.page" = false;
      "browser.ml.linkPreview.enabled" = false;
      "browser.tabs.groups.smart.enabled" = false;
      "browser.tabs.groups.smart.userEnabled" = false;
      "browser.translations.enable" = true;
      "extensions.ml.enabled" = false;
      "pdfjs.enableAltText" = false;
    };
    extensions.force = true;
  };
  policies = {
    DontCheckDefaultBrowser = true;
    DisableTelemetry = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableFirefoxScreenshots = true;

    DisplayBookmarksToolbar = "never";
    DisplayMenuBar = "never";

    OverrideFirstRunPage = "";
    PictureInPicture.Enabled = false;
    PromptForDownloadLocation = false;

    HardwareAcceleration = true;
    TranslateEnabled = true;

    Homepage.StartPage = "previous-session";

    UserMessaging = {
      UrlbarInterventions = false;
      SkipOnboarding = true;
    };

    FirefoxSuggest = {
      WebSuggestions = false;
      SponsoredSuggestions = false;
      ImproveSuggest = false;
    };

    EnableTrackingProtection = {
      Value = true;
      Cryptomining = true;
      Fingerprinting = true;
    };

    FirefoxHome = # Make new tab only show search
      {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };

    Handlers.schemes.vscode = {
      action = "useSystemDefault"; # Open VSCode app
      ask = false;
    };
  };
in
if gui-system then
  {
    home-manager.users.${username} = {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox-bin;
        inherit profiles;
        inherit policies;
      };

      catppuccin.firefox.enable = true;
      catppuccin.firefox.profiles.default = {
        enable = true;
        force = true;
      };
    };
  }
else
  { }
