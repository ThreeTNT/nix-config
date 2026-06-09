{
  pkgs,
  ...
}:
{
  home-manager.users.lena.home.packages = with pkgs; [
    nixd
    nixfmt
    nixfmt-tree
  ];
}
