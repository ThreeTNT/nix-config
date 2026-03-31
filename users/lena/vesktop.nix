{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    programs.vesktop = {
      enable = true;
      package = pkgs.vesktop;
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        disableMinSize = true;
        plugins = {
          MessageLogger = {
            enabled = true;
            ignoreSelf = false;
          };
          Translate = {
            enabled = true;
            recievedInput = "auto";
            sentInput = "en";
            service = "google";
          };
          UserMessagesPronouns = {
            enabled = true;
            showSelf = true;
          };
          ShikiCodeblocks.enabled = true;
          FakeNitro.enabled = true;
          RelationshipNotifier.enabled = true;
          ExpressionCloner.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };

    catppuccin.vesktop.enable = true;
  };
}