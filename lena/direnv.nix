{
  home-manager.users.lena = {
    programs.direnv = {
      enable = true;
      enableFishIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
