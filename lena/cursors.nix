{ pkgs, ... }:
{
  home-manager.users.lena = {
    home.pointerCursor = {
      name = "Catppucin-Macchiato-Mauve-Cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 14;

      gtk.enable = true;
      x11.enable = true;
    };
  };
}
