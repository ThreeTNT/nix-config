{ flake-inputs, config, ... }:
{
  sops.secrets.weak-password.neededForUsers = true;
  users.users.lena = {
    isNormalUser = true;
    group = "wheel";
    extraGroups = [ ];
    hashedPasswordFile = config.sops.secrets.weak-password.path;
    home = "/home/lena";
  };

  home-manager.users.lena = {
    imports = with flake-inputs; [
      catppuccin.homeModules.catppuccin
    ];

    catppuccin = {
      enable = true;
      autoEnable = false;
      flavor = "mocha";
      accent = "mauve";
    };

    xdg.userDirs = {
      createDirectories = true;
    };

    home.stateVersion = "26.11";
  };

  imports = [
    ../../lena/secrets/secrets.nix
    ../../lena/lena.nix
    ../../lena/ssh/ssh.nix
    ../../lena/basic-linux.nix

    ../../lena/fish/fish.nix

    ../../lena/bitwarden/rbw.nix

    ../../lena/git.nix
    ../../lena/fastfetch.nix
    ../../lena/btop.nix

    ../../lena/helix.nix
    ../../lena/direnv.nix
    ../../lena/fonts.nix
  ];
}
