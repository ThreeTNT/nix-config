{ username, config, ... }:
let
  home = config.home-manager.users.${username}.home.homeDirectory;
in
{
  home-manager.users.${username}.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "mac" = {
        user = "lena";
        hostname = "lenas-mac";
      };
      "pc" = {
        user = "lena";
        hostname = "celosia";
      };
      "minipc1" = {
        user = "lena";
        hostname = "lenas-minipc";
      };
      "rpi" = {
        user = "lena";
        hostname = "lenas-rpi";
      };
      "hfcs" = {
        user = "z366zhu";
        hostname = "hfcs.csclub.uwaterloo.ca";
      };
      "neotame" = {
        user = "z366zhu";
        hostname = "neotame.csclub.uwaterloo.ca";
      };
      "uwcs" = {
        user = "z366zhu";
        hostname = "linux.student.cs.uwaterloo.ca";
      };
      "slop" = {
        user = "slop";
        hostname = "10.0.30.186";
      };

      "*" = {
        identityAgent = "${home}/.bitwarden-ssh-agent.sock";
        forwardAgent = false;
        sendEnv = [
          "-LANG"
          "-LC_CTYPE"
        ];
      };
    };
  };
}
