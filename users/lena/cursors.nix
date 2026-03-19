{ username, pkgs, ... }:
{
  home-manager.users.${username} = {
    # catppuccin.cursors.enable = true;

    home.pointerCursor = {
      name = "Catppucin-Macchiato-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 14;

      # hyprCursor.enable = true;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}