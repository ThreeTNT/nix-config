{ flake-inputs, config, ... }:
{
  sops.secrets."lena-passwd".neededForUsers = true;
  users.users.lena = {
    isNormalUser = true;
    group = "wheel";
    extraGroups = [
      "dialout"
      "input"
      "i2c"
      "plugdev"
    ];
    hashedPasswordFile = config.sops.secrets."lena-passwd".path;
    home = "/home/lena";
  };

  home-manager.users.lena = {
    imports = with flake-inputs; [
      catppuccin.homeModules.catppuccin
      sops-nix.homeManagerModules.sops
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
    ../../lena/lena.nix
    ../../lena/secrets/secrets.nix
    ../../lena/ssh/ssh.nix
    ../../lena/basic-linux.nix

    ../../lena/fish/fish.nix

    ../../lena/bitwarden/rbw-linux.nix

    ../../lena/git.nix
    ../../lena/fastfetch.nix
    ../../lena/btop.nix

    ../../lena/helix.nix
    ../../lena/direnv.nix
    ../../lena/kitty.nix
  ];
}
