{ username, ... }:
{
  home-manager.users.${username}.programs.kitty = {
    enable = true;
  };
}
