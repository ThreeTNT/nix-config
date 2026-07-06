{
  config,
  ...
}:
let
  # niri's `open-floating` only applies at the moment a window is created
  # (it's an "opening property", like Hyprland's `workspace` rules), it
  # can't force an already-tiled window to float later the way a persistent
  # Hyprland windowrule can. That's fine here since all of these are "float
  # this kind of window when it opens" rules anyway.
  #
  # niri also has no built-in "center on open" property for floating
  # windows. If you need pixel-perfect centering (rather than whatever
  # position the client itself requests), bind a key to the `center-window`
  # action, or extend scripts/bitwarden-extension.sh's event-stream pattern
  # to call `niri msg action center-window` for these app-ids too.
  generic-window-rules = [
    # File picking
    {
      matches = [
        { title = "^(Open File)(.*)$"; }
        { title = "^(Select a File)(.*)$"; }
        { title = "^(Open Folder)(.*)$"; }
        { title = "^(Save As)(.*)$"; }
        { title = "^(Library)(.*)$"; }
        { title = "^(File Upload)(.*)$"; }
        { title = "^(Location)$"; }
        { title = "(.*)(wants to save)$"; }
        { title = "(.*)(wants to open)$"; }
      ];
      open-floating = true;
    }

    {
      matches = [ { app-id = "^(com\\.saivert\\.pwvucontrol)$"; } ];
      open-floating = true;
      default-column-width.fixed = 720;
      default-window-height.fixed = 480;
    }
    {
      matches = [ { app-id = "^(org\\.prismlauncher\\.PrismLauncher)$"; } ];
      open-floating = true;
      default-column-width.fixed = 1280;
      default-window-height.fixed = 960;
    }
    {
      matches = [
        {
          app-id = "^(steam)$";
          title = "^(Steam)$";
        }
      ];
      open-floating = true;
      default-column-width.fixed = 1500;
      default-window-height.fixed = 900;
    }
    {
      matches = [ { app-id = "^(Bitwarden)$"; } ];
      open-floating = true;
      default-column-width.fixed = 1280;
      default-window-height.fixed = 960;
    }
    {
      matches = [ { app-id = "^(org\\.kde\\.dolphin)$"; } ];
      open-floating = true;
      default-column-width.fixed = 1200;
      default-window-height.fixed = 720;
    }
    {
      matches = [ { app-id = "^(Matplotlib)$"; } ];
      open-floating = true;
    }

    # Picture-in-Picture
    {
      matches = [ { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"; } ];
      open-floating = true;
      # Roughly matches Hyprland's `size (monitor_w*.25) (monitor_h*.25)`.
      default-column-width.proportion = 0.25;
      default-window-height.proportion = 0.25;
      # niri has no "pin" (always-on-top-across-workspaces) equivalent.
    }

    # Opacity (Hyprland "blurring" via opacity)
    {
      matches = [ { app-id = "^(kitty).*"; } ];
      opacity = 0.9;
    }

    # No shadow for floating -> tiled equivalent: Hyprland disabled shadow
    # for tiled windows. niri's inverse is easiest: turn shadow off globally
    # for tiled windows via is-floating=false.
    {
      matches = [ { is-floating = false; } ];
      shadow.enable = false;
    }

    # Tearing: niri has no per-window "immediate present" toggle like
    # Hyprland's `immediate on`. The closest related knob is per-output
    # variable-refresh-rate (see general.nix outputs block) plus the
    # `variable-refresh-rate` window rule for VRR-heavy apps like games:
    {
      matches = [
        { app-id = "^steam_app.*"; }
        { app-id = "^gamescope$"; }
      ];
      variable-refresh-rate = true;
    }

    # Rounding: there's no compositor-wide corner radius in niri, it's a
    # per-window-rule property, so apply it broadly here instead. This is
    # the "everyone gets rounded corners" rule that used to live in
    # decoration.rounding.
    {
      matches = [ { } ]; # matches every window
      geometry-corner-radius = {
        top-left = 12.0;
        top-right = 12.0;
        bottom-right = 12.0;
        bottom-left = 12.0;
      };
      clip-to-geometry = true;
    }
  ];

  # Blur: niri only gained background blur (26.04+) as a window rule, not a
  # compositor-wide toggle. This approximates Hyprland's `blur { enabled;
  # xray; }` for windows you'd want it on, e.g. terminals/panels.
  blur-window-rules = [
    {
      matches = [ { app-id = "^(kitty).*"; } ];
      background-effect = {
        blur = true;
        xray = true;
      };
    }
  ];

  celosia-window-rules = [
    {
      matches = [ { app-id = "^(com\\.saivert\\.pwvucontrol)$"; } ];
      default-column-width.fixed = 720;
      default-window-height.fixed = 480;
    }
    {
      matches = [ { app-id = "^(org\\.prismlauncher\\.PrismLauncher)$"; } ];
      default-column-width.fixed = 1280;
      default-window-height.fixed = 960;
    }
    {
      matches = [
        {
          app-id = "^(steam)$";
          title = "^(Steam)$";
        }
      ];
      default-column-width.fixed = 1500;
      default-window-height.fixed = 900;
    }
    {
      matches = [ { app-id = "^(Bitwarden)$"; } ];
      default-column-width.fixed = 1280;
      default-window-height.fixed = 960;
    }
    {
      matches = [ { app-id = "^(org\\.kde\\.dolphin)$"; } ];
      default-column-width.fixed = 1200;
      default-window-height.fixed = 720;
    }
  ];

  window-rules-lookup = {
    "celosia" = celosia-window-rules;
  };

  # Send Vesktop straight to its own workspace at startup, since niri has no
  # true "special"/scratchpad workspace to silently park it in. See
  # scripts/vesktop.sh for the always-on silent-move version of this that
  # also handles windows opened after startup (not just at launch).
  vesktop-window-rules = [
    {
      matches = [ { app-id = "^(vesktop|discord)$"; } ];
      open-on-workspace = "vesktop";
    }
  ];
in
{
  home-manager.users.lena.programs.niri.settings.window-rules =
    generic-window-rules
    ++ blur-window-rules
    ++ vesktop-window-rules
    ++ (window-rules-lookup.${config.networking.hostName} or [ ]);
}
