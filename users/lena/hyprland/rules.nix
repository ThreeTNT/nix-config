{ username, ... }:
{
  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        # Disable blur for xwayland context menus
        "match:class ^()$, match:title ^()$, no_blur on"

        # Floating
        "match:title ^(Open File)(.*)$, center on"
        "match:title ^(Open File)(.*)$, float on"
        "match:title ^(Select a File)(.*)$, center on"
        "match:title ^(Select a File)(.*)$, float on"
        "match:title ^(Choose wallpaper)(.*)$, center on"
        "match:title ^(Choose wallpaper)(.*)$, float on"
        "match:title ^(Choose wallpaper)(.*)$, size (monitor_w*.60) (monitor_h*.65)"
        "match:title ^(Open Folder)(.*)$, center on"
        "match:title ^(Open Folder)(.*)$, float on"
        "match:title ^(Save As)(.*)$, center on"
        "match:title ^(Save As)(.*)$, float on"
        "match:title ^(Library)(.*)$, center on"
        "match:title ^(Library)(.*)$, float on"
        "match:title ^(File Upload)(.*)$, center on"
        "match:title ^(File Upload)(.*)$, float on"
        "match:title ^(.*)(wants to save)$, center on"
        "match:title ^(.*)(wants to save)$, float on"
        "match:title ^(.*)(wants to open)$, center on"
        "match:title ^(.*)(wants to open)$, float on"

        "match:class ^(com\\.saivert\\.pwvucontrol)$, float on"
        "match:class ^(com\\.saivert\\.pwvucontrol)$, size 480 360"
        "match:class ^(com\\.saivert\\.pwvucontrol)$, center on"
        "match:class ^(steam)$, float on"
        "match:class ^(steam)$, match:title ^(Steam)$, size 1500 900"
        "match:class ^(org.prismlauncher.PrismLauncher)$, float on"
        "match:class ^(org.prismlauncher.PrismLauncher)$, size 1280 960"

        "match:class ^(Bitwarden)$, float on"
        "match:class ^(Bitwarden)$, size 1280 960"
        "match:class ^(Bitwarden)$, center on"
        "match:class ^(firefox)$, match:title ^(.*)(Bitwarden Password Manager)(.*)$, float on"

        "match:class ^(org\\.kde\\.dolphin)$, float on"

        # Picture-in-Picture
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, keep_aspect_ratio on"
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, move (monitor_w*.73) (monitor_h*.72)"
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, size (monitor_w*.25) (monitor_h*.25)"
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
        "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, pin on"

        # Tearing
        "match:title .*\.exe, immediate on"
        "match:title .*minecraft.*, immediate on"
        "match:class ^(steam_app).*, immediate on"

        "match:class ^(kitty).*, opacity 0.9 0.8"

        # Fix Jetbrain IDEs focus/rerendering problem
        "match:class ^jetbrains-.*$, match:float 1, match:title ^$|^\s$|^win\d+$, no_initial_focus on"

        # No shadow for tiled windows (matches windows that are not floating).
        "match:float 0, no_shadow on"
      ];
    };
  };
}
