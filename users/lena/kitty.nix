{ username, ... }:
{
  home-manager.users.${username} = {
    programs.kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      font.name = "Hack Nerd Font";
      font.size = 14.0;
    };
    
    catppuccin.kitty.enable = true;
  };
}
