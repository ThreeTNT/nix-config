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

    userSettings = {
      files.exclude = {
        "**/__pycache__" = true;
        "**/.cache" = true;
        "**/.pytest_cache" = true;
        "**/.ruff_cache" = true;
        "**/*.dSYM" = true;
        "**/*.egg-info" = true;
      };
      files.autoSave = false;
      editor.fontFamily = "Hack Nerd Font Mono";
      explorer.confirmPasteNative = false;
      explorer.confirmDelete = false;
      explorer.confirmDragAndDrop = false;
      workbench.tree.indent = 16;
      terminal.integrated.enableImages = true;
      terminal.integrated.enableMultiLinePasteWarning = "never";
      github.gitProtocol = "ssh";
      git.confirmSync = false;

      nix.serverPath = "nixd";
      nix.enableLanguageServer = true;
    };
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
