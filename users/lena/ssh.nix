{ username, ... }:
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
        hostname = "100.65.205.17";
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

      "*" = {
        sendEnv = [
          "-LANG"
          "-LC_CTYPE"
        ];
        forwardAgent = true;
      };
    };
  };
}
