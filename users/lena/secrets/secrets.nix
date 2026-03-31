{ ... }:
{
  sops = {
    age.sshKeyPaths = [ ../../../ed25519_key ];

    secrets = {
      weak-password = {
        sopsFile = ./general.yaml;
      };
      strong-password = {
        sopsFile = ./general.yaml;
      };
      tailscale-authkey = {
        sopsFile = ./general.yaml;
      };
      email = {
        sopsFile = ./general.yaml;
      };
      bw-url = {
        sopsFile = ./general.yaml;
      };
    };
  };
}
