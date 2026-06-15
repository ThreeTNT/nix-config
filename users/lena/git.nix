{ username, ... }:
{
  home-manager.users.${username}.programs.git = {
    enable = true;
    settings = {
      user.name = "Lena";
      user.email = "lenazhu2007@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = false;

      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
