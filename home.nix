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

    home.packages = [ 
        pkgs.bat
        pkgs.direnv
        pkgs.fzf
        pkgs.gnupg
        pkgs.hello
        pkgs.htop
        pkgs.jetbrains.idea-community
        pkgs.jq
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