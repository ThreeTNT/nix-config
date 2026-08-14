{ pkgs, ... }:
{
  home-manager.users.lena.home.packages = [
    pkgs.wechat-uos
  ];
}
