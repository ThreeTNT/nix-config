{
  username,
  host-config,
  lib,
  ...
}:
{
  home-manager.users.${username}.programs.caelestia = {
    enable = (host-config.gpu != "none") && host-config.gui;
    systemd.enable = false;

    settings = {
      bar.status.showBattery = host-config.battery;
      services.smartScheme = false;

      paths = {
        wallpaperDir = "~/Pictures";
      };

      general = {
        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [
            {
              timeout = 300;
              idleAction = "hyprctl dispatch dpms off";
              returnAction = "hyprctl dispatch dpms on";
            }
            (lib.mkIf host-config.battery {
              timeout = 600;
              idleAction = "systemctl suspend";
            })
          ];
        };

        apps = {
          terminal = [ "kitty" ];
          audio = [ "pwvucontrol" ];
          playback = [ "mpv" ];
          explorer = [ "dolphin" ];
        };
      };
    };

    cli.enable = (host-config.gpu != "none") && host-config.gui;
  };
}
