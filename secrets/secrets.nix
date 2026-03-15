{ ... }:
{
  sops = {
    defaultSopsFile = ./general.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets = {
      weak-password = { };
      strong-password = { };
      tailscale-authkey = { };
    };
  };
}
