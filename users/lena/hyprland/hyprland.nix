{ username, pkgs, flake-inputs, ... }:
let
  plugins = flake-inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  home-manager.users.${username}.wayland.windowManager.hyprland = {
    enable = true;

    plugins = with plugins; [
      # hyprbars # build is broken rn
    ];
  };
}
