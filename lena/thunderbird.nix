{ pkgs, lib, ... }:
{
  home-manager.users.lena = {
    programs.thunderbird = {
      enable = true;
      package = pkgs.thunderbird-140;

      profiles.default = {
        isDefault = true;
        settings = {
          "privacy.donottrackheader.enabled" = true;
          "mail.spam.manualMark" = true;
        };

        accountsOrder = [
          "gmail"
          "estrogenuinely"
          "uwaterloo"
        ];
      };
    };

    accounts.email.accounts = {
      gmail = {
        primary = true;
        flavor = "gmail.com";
        userName = "lenazhu2007@gmail.com";
        address = "lenazhu2007@gmail.com";
        realName = "Lena";
        thunderbird = {
          enable = true;
          profiles = [ "default" ];
        };
      };
      estrogenuinely = {
        address = "lena@estrogenuinely.ca";
        userName = "lena";
        realName = "Lena";

        imap = {
          host = "mail.estrogenuinely.ca";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "mail.estrogenuinely.ca";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };

        thunderbird = {
          enable = true;
          profiles = [ "default" ];
        };
      };
      uwaterloo = {
        address = "z366zhu@uwaterloo.ca";
        userName = "z366zhu@uwaterloo.ca";
        realName = "Lena";

        imap = {
          host = "outlook.office365.com";
          port = 993;
          tls.enable = true;
        };

        smtp = {
          host = "smtp.office365.com";
          port = 587;
          tls = {
            enable = true;
            useStartTls = true;
          };
        };

        thunderbird = {
          enable = true;
          profiles = [ "default" ];
          settings = id: {
            "mail.server.server_${id}.authMethod" = 10;
            "mail.smtpserver.smtp_${id}.authMethod" = 10;
          };
        };
      };
    };
  };
}
