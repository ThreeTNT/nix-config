{
  username,
  pkgs,
  flake-inputs,
  host-config,
  lib,
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
        ms-python.python
        tamasfe.even-better-toml
        rust-lang.rust-analyzer

        icrawl.discord-vscode
        jnoortheen.nix-ide

        mkhl.direnv
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
      editor.inlayHints.enabled = "offUnlessPressed";
      explorer.confirmPasteNative = false;
      explorer.confirmDelete = false;
      explorer.confirmDragAndDrop = false;
      explorer.sortOrder = "type";
      workbench.tree.indent = 16;
      terminal.integrated.enableImages = true;
      terminal.integrated.enableMultiLinePasteWarning = "never";
      github.gitProtocol = "ssh";
      git.confirmSync = false;

      nix.serverPath = "nixd";
      nix.enableLanguageServer = true;

      "[racket]" = {
        editor.indentSize = 2;
        editor.tabSize = 2;
      };
      "[C]" = {
        editor.indentSize = 4;
        editor.tabSize = 4;
      };
    };
  };

  homework-profile = {
    extensions =
      (with pkgs.nix-vscode-extensions.vscode-marketplace; [
        llvm-vs-code-extensions.vscode-clangd
        evzen-wybitul.magic-racket
        jnoortheen.nix-ide
        mkhl.direnv
      ])
      ++ [
        lldb
      ];

    userSettings = lib.recursiveUpdate default-profile.userSettings {
      # empty for now
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
      profiles."CS Homework" = homework-profile;
    };

    catppuccin.vscode.profiles.default.enable = true;
    catppuccin.vscode.profiles."CS Homework".enable = true;
  };
}
