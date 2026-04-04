{ username, host-config, ... }:
{
  programs.steam.enable = host-config.gui && host-config.gpu != "none";
}
