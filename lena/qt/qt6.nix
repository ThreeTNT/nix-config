{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    (lib.mkIf false {
      environment.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt6ct";
        SAL_USE_VCLPLUGIN = "qt6";
      };
    })
  ];

  home-manager.users.lena = {
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
