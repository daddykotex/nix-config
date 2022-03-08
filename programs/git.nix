{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "David Francoeur";
    userEmail = "dfrancoeur04@gmail.com";

    delta.enable = true;

    aliases = {
      co = "checkout";
      cob = "checkout -b";
      pu = "push -u";
      rsh = "reset --hard";
      rc = "rebase --continue";
      ria = "rebase --interactive --autosquash";
      ra = "rebase --abort";
    };

    ignores = [
      ".metals/"
      ".history/"
      "**/project/metals.sbt"
      ".idea/"
      ".vscode/settings.json"
      ".bloop/"
      ".bsp/"
    ];

    includes = [
      {
        condition = "gitdir:~/workspace/disney/";
        contents.user = {
          name = "David Francoeur";
          email = "david.francoeur@disneystreaming.com";
        };
      }
    ];

    extraConfig = {
      pull = { ff = "only"; };
      init.defaultBranch = "main";
    };
  };
}