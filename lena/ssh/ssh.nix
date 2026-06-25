{
  pkgs,
  config,
  lib,
  ...
}:
let
  home = config.home-manager.users.lena.home.homeDirectory;
in
{
  home-manager.users.lena = {
    # home.file."ssh-agent-select".source =
    #   config.home-manager.users.lena.lib.file.mkOutOfStoreSymlink ./ssh-agent-select;

    home.activation.ssh-selector-link = lib.mkAfter ''
      ln -sf ${./ssh-agent-select} ${home}/ssh-agent-select
    '';

    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "mac" = {
          User = "lena";
          HostName = "lenas-mac";
        };
        "pc" = {
          User = "lena";
          HostName = "celosia";
        };
        "minipc-1" = {
          User = "lena";
          HostName = "minipc-1";
        };
        "rpi" = {
          User = "lena";
          HostName = "lenas-rpi";
        };
        "hfcs" = {
          User = "z366zhu";
          HostName = "hfcs.csclub.uwaterloo.ca";
        };
        "neotame" = {
          User = "z366zhu";
          HostName = "neotame.csclub.uwaterloo.ca";
        };
        "uwcs" = {
          User = "z366zhu";
          HostName = "linux.student.cs.uwaterloo.ca";
        };
        "Match host * exec \"${home}/ssh-agent-select bitwarden\"" = {
          IdentityAgent = "${home}/.bitwarden-ssh-agent.sock";
        };
        "Match host * exec \"${home}/ssh-agent-select rbw\"" = {
          IdentityAgent = "/run/user/1000/rbw/ssh-agent-socket";
        };
        "*" = {
          ForwardAgent = false;
          SendEnv = [
            "-LANG"
            "-LC_CTYPE"
          ];
        };
      };
    };
  };
}
