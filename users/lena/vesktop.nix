{
  username,
  pkgs,
  host-config,
  config,
  ...
}:
let
  theme-file = config.home-manager.users.${username}.catppuccin.flavor;
in
{
  home-manager.users.${username} = {
    programs.vesktop = {
      enable = host-config.gui;
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
            theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/refs/heads/main/packages/tm-themes/themes/catppuccin-${theme-file}.json";
          };
          CallTimer.enabled = true;
          FakeNitro.enabled = true;
          ImageZoom.enabled = true;
          MemberCount.enabled = true;
          MessageLogger.enabled = true;
          YoutubeAdblock.enabled = true;
          UserMessagesPronouns.enabled = true;
          ExpressionCloner.enabled = true;
          ServerInfo.enabled = true;
          Translate.enabled = true;
        };
      };
    };

    catppuccin.vesktop.enable = true;
  };
}
