{
  username,
  host-config,
  pkgs,
  lib,
  ...
}:
lib.mkIf host-config.gui {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
