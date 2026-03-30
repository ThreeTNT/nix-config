{
  username,
  pkgs,
  config,
  ...
}:
let
  cfg_dir =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "Library/Application Support"
    else
      config.home-manager.users.${username}.xdg.configHome;

  pinentry = pkgs.pinentry-qt;
in
{
  home-manager.users.${username} = {
    home.packages = [
      pkgs.rbw
      pinentry
    ];
  };

  # why is home-manager rbw so fucky?
  system.activationScripts.rbw-setup = {
    deps = [ "setupSecrets" ];
    text = ''
      mkdir -p ${cfg_dir}/rbw
      echo "{
        \"email\": \"$(cat ${config.sops.secrets.email.path})\",
        \"base_url\": \"$(cat ${config.sops.secrets.bw-url.path})\",
        \"pinentry\": \"${pinentry}\"
      }" > ${cfg_dir}/rbw/config.json
      chmod 700 ${cfg_dir}/rbw
      chmod 600 ${cfg_dir}/rbw/config.json
      chown -R lena:users ${cfg_dir}/rbw
    '';
  };
}
