{
  pkgs,
  lib,
  host-config,
  flake-inputs,
  ...
}:
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      bash

      nixd
      nixfmt
      nixfmt-tree
      ty

      (lib.mkIf host-config.gui localsend)
      (lib.mkIf host-config.gui playerctl)
      (lib.mkIf host-config.gui pwvucontrol)
      (lib.mkIf host-config.gui gamescope)

      ddcutil
      libheif

      tmux
      delta

      kiro-cli
    ];
  };
}
