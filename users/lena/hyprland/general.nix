{ username, lib, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland = {
    settings = {
      xwayland.force_zero_scaling = true;

      monitor = [
        ",preferred,auto,1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 4;
        allow_tearing = true;
      };

      exec-once = [
        "caelestia-shell"
        "bash ${./scripts/bitwarden-extension.sh}"
        "sleep 3 && bitwarden"
        "vesktop && sleep 3 && hyprctl dispatch movetoworkspacesilent special,class:vesktop"
      ];

      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = false;
      };

      decoration = {
        rounding_power = 2;
        rounding = 12;

        blur = {
          enabled = true;
          xray = true;
          size = 10;
          passes = 3;
        };

        shadow = {
          enabled = true;
          range = 50;
          offset = "0 4";
          render_power = 3;
          color = "rgba(000000A0)";
        };

        dim_inactive = true;
        dim_strength = 0.1;
        dim_special = 0.3;
      };

      animations = {
        enabled = true;

        bezier = [
          "expressiveFastSpatial, 0.42, 1.67, 0.21, 0.90"
          "expressiveSlowSpatial, 0.39, 1.29, 0.35, 0.98"
          "expressiveDefaultSpatial, 0.38, 1.21, 0.22, 1.00"
          "emphasizedDecel, 0.05, 0.7, 0.1, 1"
          "emphasizedAccel, 0.3, 0, 0.8, 0.15"
          "standardDecel, 0, 0, 0, 1"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.52, 0.03, 0.72, 0.08"
          "stall, 1, -0.1, 0.7, 0.85"
        ];

        animation = [
          "windowsIn, 1, 3, emphasizedDecel, popin 80%"
          "fadeIn, 1, 3, emphasizedDecel"
          "windowsOut, 1, 2, emphasizedDecel, popin 90%"
          "fadeOut, 1, 2, emphasizedDecel"
          "windowsMove, 1, 3, emphasizedDecel, slide"
          "border, 1, 10, emphasizedDecel"
          "layersIn, 1, 2.7, emphasizedDecel, popin 93%"
          "layersOut, 1, 2.4, menu_accel, popin 94%"
          "fadeLayersIn, 1, 0.5, menu_decel"
          "fadeLayersOut, 1, 2.7, stall"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspaceIn, 1, 2.8, emphasizedDecel, slidevert"
          "specialWorkspaceOut, 1, 1.2, emphasizedAccel, slidevert"
          "zoomFactor, 1, 3, standardDecel"
        ];
      };

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        repeat_delay = 250;
        repeat_rate = 35;

        follow_mouse = 1;
        off_window_axis_events = 2;

        sensitivity = -0.35;
        accel_profile = "flat";

        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.7;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = 1;
        vrr = 1;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        on_focus_under_fullscreen = 2;
        allow_session_lock_restore = true;
        session_lock_xray = true;
        focus_on_activate = true;
      };

      binds = {
        scroll_event_delay = 0;
        hide_special_on_workspace_change = true;
      };

      cursor = {
        zoom_factor = 1;
        zoom_rigid = false;
        zoom_disable_aa = true;
        hotspot_padding = 1;
      };
    };
  };
}
