{ lib, options, ... }:
{
  # Enable systemd-resolved (caching DNS resolver) on NixOS hosts.
  # Gated on the option existing, since this module is shared with the
  # nix-darwin host, where services.resolved is not defined.
  config = lib.optionalAttrs (options.services ? resolved) {
    services.resolved.enable = true;
  };
}
