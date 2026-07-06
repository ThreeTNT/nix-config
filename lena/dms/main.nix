{ ... }:
{
  home-manager.users.lena.programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting items from the clipboard (wtype)

    plugins = {
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;

      mediaPlayer = {
        enable = true;
        settings = {
          preferredSource = "spotify";
        };
      };
    };
  };
}
