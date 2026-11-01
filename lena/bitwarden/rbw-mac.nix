{
  pkgs,
  config,
  ...
}:
let
  cfg_dir = "Users/lena/Library/Application\\ Support";
  email-path = config.home-manager.users.lena.sops.secrets.email.path;
  bw-url-path = config.home-manager.users.lena.sops.secrets.bw-url.path;

in
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      rbw
      pinentry-tty
    ];
  };

  # Script to set up RBW configs using SOPS
  system.activationScripts.postActivation.text = ''
    mkdir -p ${cfg_dir}/rbw
    echo "{
      \"email\": \"$(cat ${email-path})\",
      \"base_url\": \"$(cat ${bw-url-path})\",
      \"pinentry\": \"${pkgs.pinentry-tty}/bin/pinentry\"
    }" > ${cfg_dir}/rbw/config.json
    chmod 700 ${cfg_dir}/rbw
    chmod 600 ${cfg_dir}/rbw/config.json
    chown -R lena ${cfg_dir}/rbw
  '';
}
