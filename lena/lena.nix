{
  pkgs,
  ...
}:
{
  users.users.lena = {
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICw7CHZkiNoG7StuF3NBnCHRWvsujJdX4ZTDIhz6YonH"
    ];
  };

  home-manager.backupFileExtension = "hm-backup";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
