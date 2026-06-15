{ ... }:
{
  sops = {
    age.sshKeyPaths = [ ./id_ed25519 ];

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
