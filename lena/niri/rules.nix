{
  config,
  ...
}:
let
  generic-window-rules = [
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
          app-id = "^(CurseForge)$";
        }
      ];
      open-floating = true;
      default-column-width.fixed = 1500;
      default-window-height.fixed = 900;
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
      matches = [
        {
          app-id = "^(steam)$";
          title = "^(Friends List)$";
        }
      ];
      open-floating = true;
      default-column-width.fixed = 500;
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
    {
      matches = [ { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"; } ];
      open-floating = true;
      default-column-width.proportion = 0.25;
      default-window-height.proportion = 0.25;
    }
    {
      matches = [ { app-id = "^(kitty).*"; } ];
      opacity = 0.9;
    }
    {
      matches = [ { is-floating = false; } ];
      shadow.enable = false;
    }
    {
      matches = [
        { app-id = "^steam_app.*"; }
        { app-id = "^gamescope$"; }
      ];
      variable-refresh-rate = true;
    }
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

  blur-window-rules = [
    {
      matches = [ { app-id = "^(kitty).*"; } ];
      background-effect = {
        blur = true;
        xray = true;
      };
    }
  ];

  celosia-window-rules = [ ];

  window-rules-lookup = {
    "celosia" = celosia-window-rules;
  };

  vesktop-window-rules = [
    {
      matches = [ { app-id = "^(vesktop|discord)$"; } ];
      open-on-workspace = "scratch";
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
