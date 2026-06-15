{ pkgs, lib, ... }:
{
  services.openssh = {
    enable = true;
    settings = lib.mkMerge [
      { PasswordAuthentication = true; }
      (
        if pkgs.stdenv.isLinux then
          {
            KexAlgorithms = [
              "mlkem768x25519-sha256"
              "sntrup761x25519-sha512"
              "sntrup761x25519-sha512@openssh.com"
              "curve25519-sha256"
              "curve25519-sha256@libssh.org"
            ];
          }
        else
          { }
      )
    ];
  };
}
