{ host-config, pkgs, username, lib, ... }:
lib.mkIf host-config.gui {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
