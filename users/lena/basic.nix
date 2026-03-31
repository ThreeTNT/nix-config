{
  pkgs,
  username,
  lib,
  host-config,
  ...
}:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    nixd
    nixfmt
    nixfmt-tree

    (lib.mkIf host-config.gui playerctl)
    (lib.mkIf host-config.gui pwvucontrol)
  ];
}
