{
  pkgs,
  ...
}:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      qt6Packages.qt6ct
      qt6Packages.qt5compat
    ];

    qt = {
      enable = true;
      platformTheme.name = "qt6ct";
    };

    home.sessionVariables.QT_QPA_PLATFORMTHEME = "qt6ct";
    home.sessionVariables.SAL_USE_VCLPLUGIN = "qt6";

    catppuccin.qt5ct = {
      enable = true;
      assertPlatformTheme = false;
    };
  };
}
