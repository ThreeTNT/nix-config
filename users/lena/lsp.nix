{ pkgs, username, ... }:
{
  home-manager.users.${username}.home.packages = with pkgs; [
    ty
    ruff
    nixd
    nixfmt
    nixfmt-tree
  ];
}
