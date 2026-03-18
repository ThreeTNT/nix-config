{ username, host-config, ... }:
{
  home-manager.users.${username}.programs.caelestia = {
    enable = host-config.gpu != "none";
    systemd.enable = false;
    settings = {
      bar.status.showBattery = host-config.battery;
      paths.wallpaperDir = "~/Pictures";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}