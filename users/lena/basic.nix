{
  pkgs,
  username,
  lib,
  host-config,
  ...
}:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    (lib.mkIf host-config.gui ckan)
    (lib.mkIf host-config.gui r2modman)

    nixd
    nixfmt
    nixfmt-tree

    (lib.mkIf host-config.gui playerctl)
    (lib.mkIf host-config.gui pwvucontrol)
    (lib.mkIf host-config.gui gamescope)

    ddcutil
  ];
}
