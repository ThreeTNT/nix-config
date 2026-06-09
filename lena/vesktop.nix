{
  pkgs,
  config,
  ...
}:
let
  flavor = config.home-manager.users.lena.catppuccin.flavor;
in
{
  home-manager.users.lena = {
    programs.vesktop = {
      enable = true;
      package = pkgs.vesktop;
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        disableMinSize = true;
      };
      vencord = {
        settings.plugins = {
          ShikiCodeblocks = {
            enabled = true;
            theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/catppuccin-${flavor}.json";
          };
          UserMessagesPronouns = {
            enabled = true;
            pronounsFormat = "LOWERCASE";
          };
          MessageLogger = {
            enabled = true;
            deleteStyle = "overlay";
            ignoreBots = false;
            ignoreSelf = false;
            ignoreUsers = "";
            ignoreChannels = "";
            ignoreGuilds = "";
            logEdits = true;
            logDeletes = true;
            collapseDeleted = false;
            inlineEdits = true;
          };
          CallTimer.enabled = true;
          FakeNitro.enabled = true;
          ImageZoom.enabled = true;
          MemberCount.enabled = true;
          YoutubeAdblock.enabled = true;
          ExpressionCloner.enabled = true;
          ServerInfo.enabled = true;
          Translate.enabled = true;
        };
      };
    };

    catppuccin.vesktop.enable = true;
  };
}
