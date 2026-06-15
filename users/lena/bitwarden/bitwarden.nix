{ username, pkgs, lib, host-config, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      (lib.mkIf host-config.gui bitwarden-desktop)
    ];
  };
}
