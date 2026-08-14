{ lib, ... }:
{
  home-manager.users.lena = {
    programs.helix = {
      enable = true;
      settings = (
        let
          shared = {
            "A-left" = "move_prev_word_start";
            "C-left" = "move_prev_word_start";
            "A-right" = "move_next_word_end";
            "C-right" = "move_next_word_end";
            "A-up" = "move_visual_line_up";
            "C-up" = "move_visual_line_up";
            "A-down" = "move_visual_line_down";
            "C-down" = "move_visual_line_down";
          };
        in
        {
          editor = {
            line-number = "relative";
            mouse = true;
            scroll-lines = 1;
            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "block";
            };
          };

          keys.normal = lib.recursiveUpdate shared {
            # Empty for now
          };
          keys.insert = lib.recursiveUpdate shared {
            # Empty for now
          };
          keys.select = lib.recursiveUpdate shared {
            # Empty for now
          };
        }
      );
      languages.language = [
        {
          name = "c";
          language-servers = [ "clangd" ];
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "cpp";
          language-servers = [ "clangd" ];
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "racket";
          language-servers = [ "racket" ];
          auto-format = false;
          indent = {
            tab-width = 2;
            unit = "  ";
          };
        }
        {
          name = "python";
          language-servers = [
            "ty"
            "ruff"
          ];
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
        {
          name = "nix";
          language-servers = [ "nixd" ];
          auto-format = true;
          indent = {
            tab-width = 2;
            unit = "  ";
          };
        }
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "clippy"
          ];
          auto-format = true;
          indent = {
            tab-width = 4;
            unit = "    ";
          };
        }
      ];
    };

    catppuccin.helix.enable = true;
  };
}
