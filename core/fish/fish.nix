{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      helix = "hx";
      lt = "ls --tree";
      ls = "eza --icons=auto";
      act = "activate";
    };

    shellInit = builtins.readFile ./shell_init.fish;
    interactiveShellInit = builtins.readFile ./interactive_init.fish;
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.pure
  ];
}
