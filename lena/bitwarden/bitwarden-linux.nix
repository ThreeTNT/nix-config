{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      bitwarden-desktop
    ];
  };
}
