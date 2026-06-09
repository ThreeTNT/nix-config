{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      libreoffice-qt6-fresh
      hunspell
      hunspellDicts.en_CA
    ];
  };
}
