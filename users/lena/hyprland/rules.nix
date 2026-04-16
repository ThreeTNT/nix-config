{
  username,
  config,
  ...
}:
let
  generic-windowrules = [
    # File picking
    "match:title ^(Open File)(.*)$, center on"
    "match:title ^(Open File)(.*)$, float on"
    "match:title ^(Select a File)(.*)$, center on"
    "match:title ^(Select a File)(.*)$, float on"
    "match:title ^(Open Folder)(.*)$, center on"
    "match:title ^(Open Folder)(.*)$, float on"
    "match:title ^(Save As)(.*)$, center on"
    "match:title ^(Save As)(.*)$, float on"
    "match:title ^(Library)(.*)$, center on"
    "match:title ^(Library)(.*)$, float on"
    "match:title ^(File Upload)(.*)$, center on"
    "match:title ^(File Upload)(.*)$, float on"
    "match:title ^(Location)$, center on"
    "match:title ^(Location)$, float on"
    "match:title ^(.*)(wants to save)$, center on"
    "match:title ^(.*)(wants to save)$, float on"
    "match:title ^(.*)(wants to open)$, center on"
    "match:title ^(.*)(wants to open)$, float on"

    "match:class ^(com\\.saivert\\.pwvucontrol)$, float on"
    "match:class ^(com\\.saivert\\.pwvucontrol)$, center on"
    "match:class ^(org.prismlauncher.PrismLauncher)$, float on"
    "match:class ^(steam)$, float on"
    "match:class ^(Bitwarden)$, float on"
    "match:class ^(Bitwarden)$, center on"

    "match:class ^(org\\.kde\\.dolphin)$, float on"

    # Picture-in-Picture
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, keep_aspect_ratio on"
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, move (monitor_w*.73) (monitor_h*.72)"
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, size (monitor_w*.25) (monitor_h*.25)"
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
    "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, pin on"

    # Tearing ???
    "match:title .*\.exe, immediate on"
    "match:title .*minecraft.*, immediate on"
    "match:class ^(steam_app).*, immediate on"

    # Opacity (blurring)
    "match:class ^(kitty).*, opacity 0.9 0.8"

    # No shadow for tiled
    "match:float 0, no_shadow on"
  ];

  celosia-windowrules = [
    "match:class ^(com\\.saivert\\.pwvucontrol)$, size 480 360"
    "match:class ^(org.prismlauncher.PrismLauncher)$, size 1280 960"
    "match:class ^(steam)$, match:title ^(Steam)$, size 1500 900"
    "match:class ^(Bitwarden)$, size 1280 960"
    "match:class ^(org\\.kde\\.dolphin)$, size 1200 720"
  ];

  windowrule-lookup = {
    "celosia" = celosia-windowrules;
  };
in
{
  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings = {
      windowrule = generic-windowrules ++ windowrule-lookup.${config.networking.hostName};
    };
  };
}
