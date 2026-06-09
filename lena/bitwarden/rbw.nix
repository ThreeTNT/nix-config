{
  pkgs,
  config,
  ...
}:
let
  cfg_dir =
    if pkgs.stdenv.isLinux then
      "${config.home-manager.users.lena.xdg.configHome}"
    else
      "${config.home-manager.users.lena.home}/Library/Application Support";
in
{
  home-manager.users.lena = {
    home.packages = with pkgs; [
      rbw
      pinentry-tty
    ];
  };

  # Script to set up RBW configs using SOPS
  system.activationScripts.rbw-setup = {
    deps = [ "setupSecrets" ];
    text = ''
      mkdir -p ${cfg_dir}/rbw
      echo "{
        \"email\": \"$(cat ${config.sops.secrets.email.path})\",
        \"base_url\": \"$(cat ${config.sops.secrets.bw-url.path})\",
        \"pinentry\": \"${pkgs.pinentry-tty}/bin/pinentry"
      }" > ${cfg_dir}/rbw/config.json
      chmod 700 ${cfg_dir}/rbw
      chmod 600 ${cfg_dir}/rbw/config.json
      chown -R lena:users ${cfg_dir}/rbw
    '';
  };
}
