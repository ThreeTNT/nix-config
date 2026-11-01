{ pkgs, ... }:
let
  logoDir = "/home/lena/Pictures/fetch-logos";

  ff = pkgs.writeShellScriptBin "ff" ''
    img=$(${pkgs.findutils}/bin/find "${logoDir}" -type f \
      \( -iname '*.png' \) \
      | ${pkgs.coreutils}/bin/shuf -n1)

    exec ${pkgs.fastfetch}/bin/fastfetch ''${img:+--logo "$img"} "$@"
  '';
in
{
  home-manager.users.lena = {
    home.packages = [ ff ];

    programs.fastfetch = {
      enable = true;

      settings = {
        logo = {
          type = "kitty-direct"; # see terminal notes below
          source = "${logoDir}/default.png"; # fallback if you run plain `fastfetch`
          # width = 40;
          height = 20;
          preserveAspectRatio = true;
          padding = {
            top = 2;
            left = 2;
            right = 3;
          };
        };

        display = {
          separator = " ➜ ";
          color = {
            keys = "#F5A9BB";
            title = "#5BCEFA";
            separator = "#F0F0F0";
          };
          key.paddingLeft = 3;
        };

        modules = [
          { type = "title"; }
          {
            type = "custom";
            format = "┌──────────────── system ────────────────┐";
            outputColor = "#5BCEFA";
          }
          "os"
          "kernel"
          "uptime"
          "packages"
          "shell"
          {
            type = "custom";
            format = "├──────────────── desktop ───────────────┤";
            outputColor = "#F5A9BB";
          }
          "wm"
          "terminal"
          "terminalfont"
          {
            type = "custom";
            format = "├─────────────── hardware ───────────────┤";
            outputColor = "#F0F0F0";
          }
          "cpu"
          "gpu"
          "memory"
          "disk"
          {
            type = "custom";
            format = "├──────────────── network ───────────────┤";
            outputColor = "#F5A9BB";
          }
          "localip"
          {
            type = "command";
            key = "Tailscale";
            text = "tailscale ip -4";
          }
          {
            type = "custom";
            format = "└────────────────────────────────────────┘";
            outputColor = "#5BCEFA";
          }
          "break"
          "colors"
        ];
      };
    };
  };
}
