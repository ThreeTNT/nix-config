{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];

    programs.rbw = {
      enable = true;
      package = pkgs.rbw;
      settings = {
        email = "lenazhu2007@gmail.com";
        baseUrl = "https://lenas-minipc.t2c40da.ts.net";
        pinentry = pkgs.pinentry-qt;
      };
    };
  };
}
