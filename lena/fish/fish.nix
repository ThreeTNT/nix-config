{ pkgs, ... }:
{
  home-manager.users.lena = {
    programs.fish = {
      enable = true;

      shellInit = builtins.readFile ./shell_init.fish;
      interactiveShellInit = builtins.readFile ./interactive_init.fish;
    };

    home.packages = with pkgs; [
      fishPlugins.pure
    ];
  };
}
