{
  username,
  host-config,
  pkgs,
  lib,
  ...
}:
lib.mkIf (host-config.gpu != "none" && host-config.gui) {
  home-manager.users.${username} = {
    home.packages = [
      (pkgs.prismlauncher.override {
        additionalLibs = with pkgs; [
          nss
          nspr
          alsa-lib
          at-spi2-atk
          cups
          pango
          cairo
        ];
      })
      pkgs.openal-soft
    ];
  };
}
