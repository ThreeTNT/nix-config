{ lib, ... }:
let
  mk-lang =
    {
      name,
      indent,
    }:
    {
      name = name;
      auto-format = true;
      indent = {
        tab-width = indent;
        unit = lib.concatStrings (lib.replicate indent " ");
      };
    };
in
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
            scroll-lines = 2;
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
        (mk-lang {
          name = "c";
          indent = 4;
        })
        (mk-lang {
          name = "cpp";
          indent = 4;
        })
        (mk-lang {
          name = "racket";
          indent = 2;
        })
        (mk-lang {
          name = "python";
          indent = 4;
        })
        (mk-lang {
          name = "nix";
          indent = 2;
        })
        (mk-lang {
          name = "rust";
          indent = 4;
        })
        (mk-lang {
          name = "scala";
          indent = 2;
        })
      ];
    };

    catppuccin.helix.enable = true;
  };
}
