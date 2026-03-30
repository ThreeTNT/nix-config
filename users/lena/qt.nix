{ username, pkgs, ... }:
{
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      qt6Packages.qt6ct
      qt6Packages.qt5compat
    ];

    qt = {
      enable = true;
      platformTheme.name = "qt6ct";
    };

    catppuccin.qt5ct = {
      enable = true;
      assertPlatformTheme = false;
    };
  };
}
