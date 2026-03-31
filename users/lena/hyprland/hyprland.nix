{ username, pkgs, flake-inputs, host-config, ... }:
let
  plugins = flake-inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home-manager.users.${username}.wayland.windowManager.hyprland = {
    enable = host-config.gui;

    plugins = with plugins; [
      # hyprbars # build is broken rn
    ];
  };
}
