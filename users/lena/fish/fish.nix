{ username, ... }:
{
  home-manager.users.${username} = {
    programs.fish = {
      enable = true;
      interactiveShellInit = builtins.readFile ./prompt_init.fish;
      shellInit = builtins.readFile ./shell_init.fish;
    };
  };
}
