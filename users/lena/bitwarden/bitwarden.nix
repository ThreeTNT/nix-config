{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      bitwarden-desktop
      rbw
      pinentry-qt
      pinentry-tty
    ];
  };
}