{
  home-manager.users.lena.programs.git = {
    enable = true;
    settings = {
      user.name = "Lena";
      user.email = "lenazhu2007@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = false;

      core.pager = "delta";
      delta.navigate = true;
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "zdiff3";

      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
}
