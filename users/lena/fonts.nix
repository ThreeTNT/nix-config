{ pkgs, username, ... }:
{
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      nerd-fonts.hack

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      stix-two

      paratype-pt-sans
      paratype-pt-serif
      paratype-pt-mono

      liberation_ttf

      corefonts
      vista-fonts

      dejavu_fonts

      fira-code
      fira-code-symbols
    ];
  };
}
