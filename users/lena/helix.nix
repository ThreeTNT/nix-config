{ username, ... }:
{
  home-manager.users.${username}.programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      editor = {
        line-number = "absolute";
        mouse = true;
        scroll-lines = 1;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
      };
    };
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
        name = "nix";
        language-servers = [ "nixd" ];
        auto-format = true;
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
    ];
  };
}
