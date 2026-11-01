# Home Manager module: Starship prompt (Catppuccin Mocha) for fish on NixOS.
#
# Expected layout (this directory is self-contained, copy it as a unit):
#   starship.nix        <- this file
#   starship.toml       <- the Starship config, linked verbatim
#
# Import it from your home-manager configuration, e.g. in home.nix:
#   imports = [ ./starship-nixos/starship.nix ];
{ config, pkgs, lib, ... }:

{
  # fish is the interactive shell this prompt targets.
  programs.fish.enable = true;

  programs.starship = {
    enable = true;
    # Adds `starship init fish | source` to fish's interactive init, so the
    # separate fish/conf.d/starship.fish file is NOT needed in this setup.
    enableFishIntegration = true;
    enableZshIntegration = false;
    enableBashIntegration = false;
    # `settings` is intentionally unset: the verbatim TOML is linked below
    # so the file is byte-for-byte the one exported from macOS.
  };

  # Starship reads ~/.config/starship.toml by default (no STARSHIP_CONFIG needed).
  xdg.configFile."starship.toml".source = ./starship.toml;

  # The prompt uses Nerd Font glyphs (OS icons, git, language symbols).
  # The terminal in use is "JetBrainsMono Nerd Font".
  # On nixpkgs older than 25.05 use: pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; }
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
}
