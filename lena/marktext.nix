{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [ marktext ];
  };
}
