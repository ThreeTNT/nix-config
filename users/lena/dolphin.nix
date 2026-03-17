{ username, ... }:
{
  home-manager.users.${username} = {
    programs.dolphin = {
      enable = true;
    };

    catppuccin.btop.enable = true;
  };
}