{ config, pkgs, ... }:
{
  home-manager.users.lena.programs.niri = {
    package = pkgs.niri-unstable;

    settings = {
      # --- outputs -----------------------------------------------------------
      # Hyprland's blank `monitor = ",2560x1440@200,auto,1"` applies to every
      # connected display. niri requires outputs to be addressed by name (or
      # by `output "*"` as of newer versions to mean "everything"), so fill in
      # the real connector name below. Run `niri msg outputs` once niri is
      # running to find it (e.g. "eDP-1", "DP-1").
      outputs."*" = {
        mode = {
          width = 2560;
          height = 1440;
          refresh = 200.0;
        };
        scale = 1.0;
        # background-color replaces Hyprland's misc.background_color, which
        # was a compositor-wide fallback color behind all windows.
        background-color = "#1D1011";
      };

      prefer-no-csd = true;
      cursor = {
        theme = config.home-manager.users.lena.home.pointerCursor.name;
        size = config.home-manager.users.lena.home.pointerCursor.size;
      };

      spawn-at-startup = [
        {
          command = [
            "tailscale"
            "systray"
          ];
        }
        {
          # niri's spawn path doesn't go through a login shell, so `sleep 3 &&`
          # style shell chaining needs spawn-sh instead of spawn.
          command = [
            "sh"
            "-c"
            "sleep 3 && bitwarden"
          ];
        }
        {
          command = [
            "bash"
            "${./scripts/bitwarden-extension.sh}"
          ];
        }

        {
          command = [
            "sh"
            "-c"
            "sleep 3 && vesktop"
          ];
        }
        {
          command = [
            "bash"
            "${./scripts/vesktop.sh}"
          ];
        }
      ];

      layout = {
        gaps = 12;

        focus-ring.enable = false;

        border = {
          enable = true;
          width = 4;
          active.gradient = {
            from = "#f0c6c6e6";
            to = "#c6a0f6e6";
            angle = 45;
          };
          inactive.color = "#24273a96";
        };

        shadow = {
          enable = true;
          softness = 50;
          spread = 0;
          offset = {
            x = 0;
            y = 4;
          };
          color = "#000000A0";
        };
      };

      input = {
        keyboard.xkb.layout = "us";
        keyboard.numlock = true;

        mouse = {
          accel-speed = -0.35;
          accel-profile = "flat";
        };

        touchpad = {
          natural-scroll = true;
          dwt = true; # disable-while-typing
          click-method = "clickfinger";
          scroll-factor = 0.7;
        };

        focus-follows-mouse.enable = false;
      };

      clipboard.disable-primary = true; # closest equivalent to middle_click_paste = false

      animations = {
        # perma-temporary "i dont wanna learn animations"
        slowdown = 1.0;
      };

      # niri will show this as a guide to new users
      # disable this because we are not using default config
      hotkey-overlay.skip-at-startup = true;

      screenshot-path = "~/Pictures/%Y-%m-%d %H-%M-%S.png";
    };
  };
}
