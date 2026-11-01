set api_key_file "$HOME/.config/sops-nix/secrets/kiro-gateway-api-key"
if test -f "$api_key_file"
    set -gx KIRO_GATEWAY_API_KEY (cat $api_key_file)
end
set -e api_key_file
