{ ... }:
{
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;

    settings = {
      csrf_allowed_origins = "https://10.0.10.42:47990,https://100.120.33.77:47990,https://celosia:47990";
    };
  };
}
