{ config, ... }:
{
  networking.hostName = "celosia";

  networking.networkmanager = {
    enable = true;
    ensureProfiles.environmentFiles = [ config.sops.secrets.home-wifi.path ];
    ensureProfiles.profiles = {
      home-wifi = {
        connection = {
          id = "@HOME_WIFI_SSID@";
          type = "wifi";
        };
        wifi = {
          mode = "infrastructure";
          ssid = "@HOME_WIFI_SSID@";
        };
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-psk";
          psk = "@HOME_WIFI_PASSWORD@";
        };
        ipv4.method = "auto";
        ipv6.method = "auto";
      };
    };
  };
}
