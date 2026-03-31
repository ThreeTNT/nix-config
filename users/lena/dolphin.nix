{
  username,
  pkgs,
  lib,
  host-config,
  ...
}:
lib.mkIf host-config.gui {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      kdePackages.qtsvg
      kdePackages.dolphin
    ];
  };
}
