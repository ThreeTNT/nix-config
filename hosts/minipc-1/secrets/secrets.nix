{ ... }:
{
  sops = {
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets = {
      "wifi/home" = {
        sopsFile = ./wifi.yaml;
      };
      "wifi/bg1004" = {
        sopsFile = ./wifi.yaml;
      };
    };
  };
}
