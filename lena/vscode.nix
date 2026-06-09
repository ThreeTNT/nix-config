{
  pkgs,
  flake-inputs,
  lib,
  ...
}:
let
  lldb = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      publisher = "vadimcn";
      name = "vscode-lldb";
      version = "1.12.2";
      sha256 = "sha256-cOOClC0uE+Ym10k2T2p/mnTcgqvLVwDH+qo/W7ul3cs=";
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
      ++ [ lldb ];

    userSettings = {
      telemetry.telemetryLevel = "off";
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

      "[nix]" = {
        editor.indentSize = 2;
        editor.tabSize = 2;
      };
      "[racket]" = {
        editor.indentSize = 2;
        editor.tabSize = 2;
      };
      "[C]" = {
        editor.indentSize = 4;
        editor.tabSize = 4;
      };
      "[cpp]" = {
        editor.indentSize = 4;
        editor.tabSize = 4;
      };
      "[rust]" = {
        editor.indentSize = 4;
        editor.tabSize = 4;
      };
      "[python]" = {
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
      ++ [ lldb ];

    userSettings = lib.recursiveUpdate default-profile.userSettings {
      # empty for now
    };
  };
in
{
  nixpkgs.overlays = [
    flake-inputs.nix-vscode-extensions.overlays.default
  ];

  home-manager.users.lena = {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      profiles.default = default-profile;
      profiles."CS Homework" = homework-profile;
    };

    catppuccin.vscode.profiles.default.enable = true;
    catppuccin.vscode.profiles."CS Homework".enable = true;
  };
}
