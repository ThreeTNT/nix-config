{
  username,
  pkgs,
  flake-inputs,
  host-config,
  ...
}:
let
  lldb = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "vadimcn";
      name = "vscode-lldb";
      version = "1.12.1";
      sha256 = "sha256-PEwhXVKYOF313tLJSB+QUfOfAHnwRSoKPLdHaGl79Xk=";
    };
  };
  default-profile = {
    enableExtensionUpdateCheck = false;
    enableMcpIntegration = false;
    enableUpdateCheck = false;
    extensions =
      (with pkgs.nix-vscode-extensions.vscode-marketplace; [
        astral-sh.ty
        charliermarsh.ruff

        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        tamasfe.even-better-toml
        rust-lang.rust-analyzer

        icrawl.discord-vscode
        jnoortheen.nix-ide
      ])
      ++ [
        lldb
      ];
  };
in
{
  nixpkgs.overlays = [
    flake-inputs.nix-vscode-extensions.overlays.default
  ];

  home-manager.users.${username} = {
    programs.vscode = {
      enable = host-config.gui;
      package = pkgs.vscodium;
      profiles.default = default-profile;
    };

    catppuccin.vscode.profiles.default.enable = true;
  };
}
