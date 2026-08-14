{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.pointerCursor = {
      # name = "Catppuccin-Macchiato-Mauve-Cursors";
      # package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 28;
      gtk.enable = true;
      x11.enable = true;
    };
    catppuccin.cursors.enable = true;
  };
}
