{ config, ... }:
let
  mkWifi =
    {
      cname,
      ssid,
      pass,
    }:
    {
      connection = {
        id = "$" + cname;
        type = "wifi";
      };
      wifi = {
        mode = "infrastructure";
        ssid = "$" + ssid;
      };
      wifi-security = {
        auth-alg = "open";
        key-mgmt = "wpa-psk";
        psk = "$" + pass;
      };
      ipv4.method = "auto";
      ipv6.method = "auto";
    };
in
{
  networking.hostName = "celosia";

  networking.networkmanager = {
    enable = true;
    ensureProfiles.environmentFiles = [
      config.sops.secrets."wifi/home".path
      config.sops.secrets."wifi/bg1004".path
    ];
    ensureProfiles.profiles = {
      home = mkWifi {
        cname = "HOME_CNAME";
        ssid = "HOME_SSID";
        pass = "HOME_PASS";
      };
      bg1004 = mkWifi {
        cname = "BG1004_NAME";
        ssid = "BG1004_SSID";
        pass = "BG1004_PASS";
      };
    };
  };

  networking.interfaces.eno1.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };

  networking.firewall.enable = false;
}
