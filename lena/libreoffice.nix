{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      # libreoffice-qt6-fresh
      libreoffice-qt-stable
      hunspell
      hunspellDicts.en_CA
    ];
  };
}
