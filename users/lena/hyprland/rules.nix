{ username, ... }:
{
  home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
    # ######## Window rules ########
    windowrules = [
      # Disable blur for xwayland context menus
      "match:class ^()$, match:title ^()$, no_blur on"

      # Disable blur for every window
      "match:class .*, no_blur on"

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
      "match:class ^(blueberry\.py)$, float on"
      "match:class ^(guifetch)$  , float on" # FlafyDev/guifetch
      "match:class ^(pavucontrol)$, float on"
      "match:class ^(pavucontrol)$, size (monitor_w*.45) (monitor_h*.45)"
      "match:class ^(pavucontrol)$, center on"
      "match:class ^(org.pulseaudio.pavucontrol)$, float on"
      "match:class ^(org.pulseaudio.pavucontrol)$, size (monitor_w*.45) (monitor_h*.45)"
      "match:class ^(org.pulseaudio.pavucontrol)$, center on"
      "match:class ^(nm-connection-editor)$, float on"
      "match:class ^(nm-connection-editor)$, size (monitor_w*.45) (monitor_h*.45)"
      "match:class ^(nm-connection-editor)$, center on"
      "match:class .*plasmawindowed.*, float on"
      "match:class kcm_.*, float on"
      "match:title .*Welcome, float on"
      "match:title .*Shell conflicts.*, float on"

      # stupid dolphin copy
      "match:title ^(Copying — Dolphin)$, move 40 80"

      # Tiling
      "match:class ^dev\.warp\.Warp$, tile on"

      # Picture-in-Picture
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, keep_aspect_ratio on"
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, move (monitor_w*.73) (monitor_h*.72)"
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, size (monitor_w*.25) (monitor_h*.25)"
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, float on"
      "match:title ^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$, pin on"

      # --- Tearing ---
      "match:title .*\.exe, immediate on"
      "match:title .*minecraft.*, immediate on"
      "match:class ^(steam_app).*, immediate on"

      # Fix Jetbrain IDEs focus/rerendering problem
      "match:class ^jetbrains-.*$, match:float 1, match:title ^$|^\s$|^win\d+$, no_initial_focus on"

      # No shadow for tiled windows (matches windows that are not floating).
      "match:float 0, no_shadow on"
    ];

  # # ######## Workspace rules ########
  # workspace = special:special, gapsout:30










  # # ######## Layer rules ########
  # layerrule = match:namespace .*, xray on
  # # layerrule = match:namespace .*, no_anim on
  # layerrule = match:namespace walker, no_anim on
  # layerrule = match:namespace selection, no_anim on
  # layerrule = match:namespace overview, no_anim on
  # layerrule = match:namespace anyrun, no_anim on
  # layerrule = match:namespace indicator.*, no_anim on
  # layerrule = match:namespace osk, no_anim on
  # layerrule = match:namespace hyprpicker, no_anim on

  # layerrule = match:namespace noanim, no_anim on
  # layerrule = match:namespace gtk-layer-shell, blur on
  # layerrule = match:namespace gtk-layer-shell, ignore_alpha 0
  # layerrule = match:namespace launcher, blur on
  # layerrule = match:namespace launcher, ignore_alpha 0.5
  # layerrule = match:namespace notifications, blur on
  # layerrule = match:namespace notifications, ignore_alpha 0.69
  # layerrule = match:namespace logout_dialog # wlogout, blur on

  # # ags
  # layerrule = match:namespace sideleft.*, animation slide left
  # layerrule = match:namespace sideright.*, animation slide right
  # layerrule = match:namespace session[0-9]*, blur on
  # layerrule = match:namespace bar[0-9]*, blur on
  # layerrule = match:namespace bar[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace barcorner.*, blur on
  # layerrule = match:namespace barcorner.*, ignore_alpha 0.6
  # layerrule = match:namespace dock[0-9]*, blur on
  # layerrule = match:namespace dock[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace indicator.*, blur on
  # layerrule = match:namespace indicator.*, ignore_alpha 0.6
  # layerrule = match:namespace overview[0-9]*, blur on
  # layerrule = match:namespace overview[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace cheatsheet[0-9]*, blur on
  # layerrule = match:namespace cheatsheet[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace sideright[0-9]*, blur on
  # layerrule = match:namespace sideright[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace sideleft[0-9]*, blur on
  # layerrule = match:namespace sideleft[0-9]*, ignore_alpha 0.6
  # layerrule = match:namespace indicator.*, blur on
  # layerrule = match:namespace indicator.*, ignore_alpha 0.6
  # layerrule = match:namespace osk[0-9]*, blur on
  # layerrule = match:namespace osk[0-9]*, ignore_alpha 0.6

  # # Quickshell
  # # Quickshell: illogical-impulse
  # layerrule = match:namespace quickshell:.*, blur_popups on
  # layerrule = match:namespace quickshell:.*, blur on
  # layerrule = match:namespace quickshell:.*, ignore_alpha 0.79
  # layerrule = match:namespace quickshell:bar, animation slide
  # layerrule = match:namespace quickshell:actionCenter, no_anim on
  # layerrule = match:namespace quickshell:cheatsheet, animation slide bottom
  # layerrule = match:namespace quickshell:dock, animation slide bottom
  # layerrule = match:namespace quickshell:screenCorners, animation popin 120%
  # layerrule = match:namespace quickshell:lockWindowPusher, no_anim on
  # layerrule = match:namespace quickshell:notificationPopup, animation fade
  # layerrule = match:namespace quickshell:overlay, no_anim on
  # layerrule = match:namespace quickshell:overlay, ignore_alpha 1
  # layerrule = match:namespace quickshell:overview, no_anim on
  # layerrule = match:namespace quickshell:osk, animation slide bottom
  # layerrule = match:namespace quickshell:polkit, no_anim on
  # layerrule = match:namespace quickshell:popup, xray off # No weird color for bar tooltips (this in theory should suffice)
  # layerrule = match:namespace quickshell:popup, ignore_alpha 1 # No weird color for bar tooltips (but somehow this is necessary)
  # layerrule = match:namespace quickshell:mediaControls, ignore_alpha 1 # Same as above
  # layerrule = match:namespace quickshell:reloadPopup, animation slide
  # layerrule = match:namespace quickshell:regionSelector, no_anim on
  # layerrule = match:namespace quickshell:screenshot, no_anim on
  # layerrule = match:namespace quickshell:session, blur on
  # layerrule = match:namespace quickshell:session, no_anim on
  # layerrule = match:namespace quickshell:session, ignore_alpha 0
  # layerrule = match:namespace quickshell:sidebarRight, animation slide right
  # layerrule = match:namespace quickshell:sidebarLeft, animation slide left
  # layerrule = match:namespace quickshell:verticalBar, animation slide
  # layerrule = match:namespace quickshell:osk, order -1
  # # Quickshell: waffles
  # layerrule = match:namespace quickshell:wallpaperSelector, animation slide top
  # layerrule = match:namespace quickshell:wNotificationCenter, no_anim on
  # layerrule = match:namespace quickshell:wOnScreenDisplay, no_anim on
  # layerrule = match:namespace quickshell:wStartMenu, no_anim on
  # layerrule = match:namespace quickshell:wTaskView, ignore_alpha 0
  # layerrule = match:namespace quickshell:wTaskView, no_anim on

  # # Launchers need to be FAST
  # layerrule = match:namespace gtk4-layer-shell, no_anim on
  };
}