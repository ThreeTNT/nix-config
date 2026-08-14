{
  pkgs,
  config,
  ...
}:
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

    FirefoxHome = {
      Search = true;
      TopSites = false;
      SponsoredTopSites = false;
      Highlights = false;
      Pocket = false;
      SponsoredPocket = false;
      Snippets = false;
    };

    Handlers.schemes.vscode = {
      action = "useSystemDefault";
      ask = false;
    };
  };
in
{
  home-manager.users.lena = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-bin;
      profiles = profiles;
      policies = policies;

      configPath =
        if pkgs.stdenv.hostPlatform.isLinux then
          "${config.home-manager.users.lena.xdg.configHome}/mozilla/firefox"
        else
          "${config.home-manager.users.lena.home.homeDirectory}/Library/Application Support/Firefox/Profiles";
    };
  };
}
