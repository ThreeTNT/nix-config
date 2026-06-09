{
  home-manager.users.lena = {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      font.name = "Hack Nerd Font";
      font.size = 13.0;
      settings.window_padding_width = 10;
    };

    catppuccin.kitty.enable = true;
  };
}
