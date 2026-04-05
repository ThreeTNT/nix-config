{
  username,
  host-config,
  pkgs,
  lib,
  ...
}:
lib.mkIf (host-config.gpu != "none" && host-config.gui)
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.en_CA
    ];
  };
}
