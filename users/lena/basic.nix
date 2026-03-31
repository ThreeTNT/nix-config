{
  pkgs,
  username,
  lib,
  host-config,
  ...
}:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    clang-tools
    cmake

    ty
    ruff
    nixd
    nixfmt
    nixfmt-tree

    (lib.mkIf host-config.gui playerctl)
  ];
}
