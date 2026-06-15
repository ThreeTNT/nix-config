{
  username,
  pkgs,
  host-config,
  lib,
  ...
}:
lib.mkIf host-config.gui {
  home-manager.users.${username} = {
    home.pointerCursor = {
      name = "Catppucin-Macchiato-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 14;

      gtk.enable = true;
      x11.enable = true;
    };
  };
}
