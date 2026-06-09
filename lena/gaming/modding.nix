{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      ckan
      r2modman
    ];
  };
}
