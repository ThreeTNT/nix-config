{ flake-inputs, config, ... }:
{
  sops.secrets.weak-password.neededForUsers = true;
  users.users.lena = {
    home = /Users/lena;
  };

  home-manager.users.lena = {
    imports = with flake-inputs; [
      catppuccin.homeModules.catppuccin
      spicetify-nix.homeManagerModules.spicetify
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
    ../../lena/basic-mac.nix

    ../../lena/fish/fish.nix

    ../../lena/bitwarden/bitwarden-mac.nix
    ../../lena/bitwarden/rbw-mac.nix

    ../../lena/gaming/modding.nix
    ../../lena/gaming/prismlauncher.nix

    ../../lena/git.nix
    ../../lena/fastfetch.nix
    ../../lena/btop.nix

    # TODO: gtk2-3?

    ../../lena/vesktop.nix
    ../../lena/vscode.nix
    ../../lena/helix.nix
    ../../lena/spotify.nix
    ../../lena/direnv.nix
    ../../lena/firefox.nix
    ../../lena/kitty.nix
    ../../lena/fonts.nix
  ];

}
