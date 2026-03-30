{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      helix = "hx";
      lt = "ls --tree";
      ls = "eza --icons=always";
      act = "activate";
    };

    promptInit = builtins.readFile ./prompt_init.fish;
    shellInit = builtins.readFile ./shell_init.fish;
    interactiveShellInit = builtins.readFile ./interactive_init.fish;
  };
}
