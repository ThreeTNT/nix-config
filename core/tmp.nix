{ pkgs, ... }:
{
  # services.x11vnc = {
  #   enable = true;
  #   auth = "/home/lena/.Xauthority";
  #   shared = true;
  #   password = "yourpassword";  # or use passwordFile
  # };
  #
  environment.systemPackages = with pkgs; [ wayvnc ];
}
