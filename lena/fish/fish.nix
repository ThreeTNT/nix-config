{
  home-manager.users.lena = {
    imports = [ ../starship/starship.nix ];

    programs.fish = {
      enable = true;

      shellInit = builtins.readFile ./shell_init.fish;
      interactiveShellInit = builtins.readFile ./interactive_init.fish;
    };
  };
}
