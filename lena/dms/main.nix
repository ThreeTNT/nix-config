{ lib, pkgs, ... }:
let
  # The bar background (Qt Quick Shapes / CurveRenderer) does not survive
  # a "Graphics device lost" event (NVIDIA EGL context loss) - quickshell
  # keeps running with a fully transparent bar until it is restarted.
  # Watch the journal and bounce dms when that happens.
  # (Observed 2026-10-30 with quickshell 0.2.1 / Qt 6.11.2 / RTX 4090.)
  dmsBarRecoveryScript = pkgs.writeShellScript "dms-bar-recovery" ''
    export PATH="${lib.makeBinPath [ pkgs.systemd ]}"
    journalctl --user -u dms.service --follow --lines=0 --output=cat |
    while read -r line; do
      case "$line" in
        *"Graphics device lost"*)
          echo "dms-bar-recovery: graphics device lost detected, restarting dms.service"
          systemctl --user restart dms.service
          # ignore journal noise from the restart itself
          sleep 20
          ;;
      esac
    done
  '';
in
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

  home-manager.users.lena.systemd.user.services.dms-bar-recovery = {
    Unit = {
      Description = "Restart DMS when its graphics context is lost (fixes transparent bar)";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${dmsBarRecoveryScript}";
      Restart = "always";
      RestartSec = "10s";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # Keep DMS's built-in idle policy (monitor off / lock / suspend, inhibitor-aware)
  # in sync with what we want. DMS owns settings.json, so merge only these keys
  # instead of making the whole file read-only via programs.dank-material-shell.settings.
  # Timeouts are in seconds, matching DMS's Power & Sleep settings tab.
  home-manager.users.lena.home.activation.dmsIdleSettings = ''
    CFG_DIR="$HOME/.config/DankMaterialShell"
    CFG="$CFG_DIR/settings.json"
    mkdir -p "$CFG_DIR"
    if [ -f "$CFG" ]; then
      tmp=$(mktemp)
      if ${pkgs.jq}/bin/jq \
        '.acMonitorTimeout = 600
        | .acLockTimeout = 900
        | .acSuspendTimeout = 3600
        | .lockBeforeSuspend = true
        | .batteryMonitorTimeout = 600
        | .batteryLockTimeout = 900
        | .batterySuspendTimeout = 3600' "$CFG" > "$tmp"; then
        mv "$tmp" "$CFG"
      else
        rm -f "$tmp"
        echo "dmsIdleSettings: failed to update $CFG" >&2
      fi
    else
      echo '{"acMonitorTimeout":600,"acLockTimeout":900,"acSuspendTimeout":3600,"lockBeforeSuspend":true,"batteryMonitorTimeout":600,"batteryLockTimeout":900,"batterySuspendTimeout":3600}' > "$CFG"
    fi
  '';
}
