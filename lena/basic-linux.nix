{
  pkgs,
  lib,
  host-config,
  ...
}:
{
  home-manager.users.lena.home.packages = with pkgs; [
    nixd
    nixfmt
    nixfmt-tree

    (lib.mkIf host-config.gui playerctl)
    (lib.mkIf host-config.gui pwvucontrol)
    (lib.mkIf host-config.gui gamescope)

    ddcutil

    kiro-cli
  ];
}
