{ username, config, ... }:
let
  home = config.home-manager.users.${username}.home.homeDirectory;
in
{
  home-manager.users.${username}.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraConfig = ''
      Match host * exec "test -S ${home}/.bitwarden-ssh-agent.sock"
        IdentityAgent ${home}/.bitwarden-ssh-agent.sock

      Match host * exec "! test -S ${home}/.bitwarden-ssh-agent.sock"
        IdentityAgent /run/user/1000/rbw/ssh-agent-socket
    '';
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
        forwardAgent = false;
        sendEnv = [
          "-LANG"
          "-LC_CTYPE"
        ];
      };
    };
  };
}
