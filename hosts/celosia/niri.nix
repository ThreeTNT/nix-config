{ config, lib, pkgs, flake-inputs, ... }:
let
  # Same settings as the user-session instance (port + allowed web UI origins),
  # derived from services.sunshine.settings so they stay in sync.
  sunshineGreeterConf = pkgs.writeText "sunshine-greeter.conf" (
    lib.concatStringsSep "\n" (
      lib.mapAttrsToList (k: v: "${k}=${toString v}") config.services.sunshine.settings
    ) + "\n"
  );
in
{
  nixpkgs.overlays = [
    flake-inputs.niri-nix.overlays.niri
  ];

  # DMS greeter via greetd, replacing SDDM + autologin. Sunshine runs inside
  # the greeter session too, so Moonlight can stream the login screen and
  # remote logins work without autologin.
  services.greetd.enable = true;

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    # Copy lena's DMS settings/session/colors so the greeter looks like the desktop
    configHome = "/home/lena";
  };

  # The greeter is spawned by greetd (a system service), not a login shell,
  # so it never picks up NixOS's XDG_DATA_DIRS. Without this the greeter
  # finds no sessions to offer and no system icon themes.
  systemd.services.greetd.environment.XDG_DATA_DIRS =
    "${config.services.displayManager.sessionData.desktops}/share:/run/current-system/sw/share";

  # dms-greeter includes /etc/greetd/niri_overrides.kdl in the greeter's niri
  # config - use it to spawn a greeter-scoped Sunshine instance. It captures via
  # wlr-screencopy + NVENC (same backend as the user session, no root/caps needed)
  # and injects input through uinput (the active seat session gets /dev/uinput
  # access via logind's ACL). The user-session instance takes over after login;
  # both share the same cert/pairing so Moonlight only ever sees one host.
  environment.etc."greetd/niri_overrides.kdl".source = pkgs.writeText "niri_overrides.kdl" ''
    spawn-at-startup "${config.services.sunshine.package}/bin/sunshine" "${sunshineGreeterConf}"
  '';

  # Share Sunshine's server cert + pairing state with the greeter user
  # (fresh copy at boot; new Moonlight pairings done from the desktop session
  # are picked up after the next reboot).
  systemd.services.sunshine-greeter-credentials = {
    description = "Share Sunshine credentials with the DMS greeter";
    wantedBy = [ "multi-user.target" ];
    before = [ "greetd.service" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      SRC="/home/lena/.config/sunshine"
      DST="/var/lib/dms-greeter/.config/sunshine"
      mkdir -p "$DST/credentials"
      if [ -f "$SRC/credentials/cacert.pem" ] && [ -f "$SRC/credentials/cakey.pem" ]; then
        cp -f "$SRC/credentials/cacert.pem" "$SRC/credentials/cakey.pem" "$DST/credentials/"
      fi
      if [ -f "$SRC/sunshine_state.json" ]; then
        cp -f "$SRC/sunshine_state.json" "$DST/sunshine_state.json"
      fi
      chown -R dms-greeter:dms-greeter "$DST" 2>/dev/null || true
    '';
  };

  programs.niri = {
    enable = true;
    package = flake-inputs.niri-nix.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    QT_QPA_PLATFORM = "wayland";
  };
}
