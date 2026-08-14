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
    ## This appears to be broken on Mac
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
          HostName = "hibiscus";
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
        "Match host * exec \"${home}/ssh-agent-select\"" = {
          IdentityAgent = "${home}/.ssh-agent";
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
