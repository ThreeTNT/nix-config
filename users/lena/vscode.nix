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

    # {
    #     "github.copilot.nextEditSuggestions.enabled": true,
    #     "python.defaultInterpreterPath": "/Users/lena/.venv/bin/python",
    #     "workbench.tree.indent": 16,
    #     "magicRacket.general.racketPath": "/Applications/Racket v8.18/bin/racket",
    #     "magicRacket.general.racoPath": "/Applications/Racket v8.18/bin/raco",
    #     "magicRacket.languageServer.command": "/Applications/Racket v8.18/bin/racket",
    #     "terminal.integrated.inheritEnv": false,
    #     "github.copilot.enable": {
    #         "*": false,
    #         "plaintext": false,
    #         "markdown": false,
    #         "scminput": false,
    #         "racket": false,
    #         "cpp": false,
    #         "jsonl": false,
    #         "rust": false,
    #         "xml": false,
    #         "python": false,
    #         "github-actions-workflow": true,
    #         "css": true
    #     },
    #     "python.createEnvironment.trigger": "off",
    #     "git.confirmSync": false,
    #     "git.enableSmartCommit": true,
    #     "makefile.configureOnOpen": false,
    #     "editor.indentSize": "tabSize",
    #     "python.languageServer": "None",
    #     "explorer.sortOrder": "type",
    #     "ruff.nativeServer": "on",
    #     "chat.tools.terminal.autoApprove": {
    #         "pytest": true
    #     },
    #     "github.gitProtocol": "ssh",
    #     "explorer.confirmPasteNative": false,
    #     "terminal.integrated.enableMultiLinePasteWarning": "never",
    #     "terminal.integrated.fontFamily": "Hack Nerd Font Mono",
    #     "C_Cpp.intelliSenseEngine": "disabled",
    #     "haskell.manageHLS": "GHCup",
    #     "remote.SSH.useLocalServer": false,
    #     "remote.SSH.remotePlatform": {
    #         "pc": "linux"
    #     },
    # }

    userSettings = {
      files.exclude = {
        "**/__pycache__" = true;
        "**/.cache" = true;
        "**/.pytest_cache" = true;
        "**/.ruff_cache" = true;
        "**/*.dSYM" = true;
        "**/*.egg-info" = true;
      };
      editor.fontFamily = "Hack Nerd Font Mono";
      explorer.confirmDelete = false;
      explorer.confirmDragAndDrop = false;
      workbench.tree.indent = 16;
      terminal.integrated.enableImages = true;
      github.gitProtocol = "ssh";

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
