{ flake-inputs, config, ... }:
{
  sops.secrets.weak-password.neededForUsers = true;
  users.users.lena = {
    isNormalUser = true;
    group = "wheel";
    extraGroups = [
      "input"
      "video"
      "i2c"
    ];
    hashedPasswordFile = config.sops.secrets.weak-password.path;
    home = "/home/lena";
  };

  home-manager.users.lena = {
    imports = with flake-inputs; [
      catppuccin.homeModules.catppuccin
      spicetify-nix.homeManagerModules.spicetify
      niri-nix.homeModules.niri
      dms.homeModules.dank-material-shell
      dms.homeModules.niri
      dms-plugin-registry.nixosModules.default
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

    # { home-manager.users.lena.wayland.windowManager.hyprland.enable = true; }
    # ../../lena/hyprland/general.nix
    # ../../lena/hyprland/rules.nix
    # ../../lena/hyprland/binds.nix

    ../../lena/niri/general.nix
    ../../lena/niri/rules.nix
    ../../lena/niri/binds.nix

    # ../../lena/caelestia/caelestia.nix

    ../../lena/dms/main.nix

    ../../lena/bitwarden/bitwarden-linux.nix
    ../../lena/bitwarden/rbw-linux.nix
    ../../lena/gaming/modding.nix
    ../../lena/gaming/prismlauncher.nix
    ../../lena/gaming/steam.nix

    ../../lena/git.nix
    ../../lena/flatpak.nix
    ../../lena/fastfetch.nix
    ../../lena/btop.nix

    ../../lena/kde.nix
    ../../lena/qt/qt6.nix
    ../../lena/gtk/gtk4.nix
    # TODO: gtk2-3?

    ../../lena/vesktop.nix
    ../../lena/vscode.nix
    ../../lena/cursors.nix
    ../../lena/helix.nix
    ../../lena/spotify.nix
    ../../lena/dolphin.nix
    ../../lena/direnv.nix
    ../../lena/libreoffice.nix
    ../../lena/firefox.nix
    ../../lena/kitty.nix
    ../../lena/fonts.nix
  ];

}
