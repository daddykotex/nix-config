{ 
  sources ? import ./nix/sources.nix,
  pkgs ? import sources.nixpkgs {},
  ...
}: {
    programs.zsh = {
        enable = true;
        history = {
            size = 100000;
        };
    };
    programs.fish = {
        enable = true;
    };

    programs.ssh = {
        enable = true;
        matchBlocks = {
          "github.bamtech.co" = {
            hostname = "github.bamtech.co";
            identityFile = "~/secrets/ssh/id_rsa.disney";
            identitiesOnly = true;
          };
        };
        extraConfig = "IdentityFile ~/secrets/ssh/id_rsa\nAddKeysToAgent yes";
    };

    home.packages = [ 
        pkgs.awscli2
        pkgs.bat
        pkgs.direnv
        pkgs.fzf
        pkgs.gnupg
        pkgs.hello
        pkgs.htop
        pkgs.jetbrains.idea-community
        pkgs.jq
        pkgs.kubectl
        pkgs.niv
        pkgs.pass
        pkgs.shellcheck
        pkgs.tree
        pkgs.vscode
    ];

    imports = [
        ./programs/git.nix
    ];

    home.sessionVariables = {
      LANG = "en_US.UTF-8";
      EDITOR = "vim";
      # Apparently nix-direnv or direnv sets this to something weird
      GNUPGHOME = "~/.gnupg";
    };
}