{
  username,
  host-config,
  lib,
  ...
}:
{
  home-manager.users.${username}.programs.caelestia = {
    enable = host-config.gui;
    systemd.enable = false;

    settings = {
      bar.status.showBattery = host-config.battery;
      services.smartScheme = false;
      background.desktopClock = {
        enabled = true;
        scale = 1.0;
        position = "bottom-right";
        shadow = {
          enabled = true;
          opacity = 0.7;
          blur = 0.4;
        };
      };

      paths = {
        wallpaperDir = "~/Pictures/wallpapers";
      };

      general = {
        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [
            {
              timeout = 300;
              idleAction = [
                "hyprctl"
                "dispatch"
                "dpms"
                "off"
              ];
              returnAction = [
                "hyprctl"
                "dispatch"
                "dpms"
                "on"
              ];
            }
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
