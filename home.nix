{ pkgs, ... }: {
    home.packages = [ 
        pkgs.bat
        pkgs.direnv
        pkgs.fzf
        pkgs.gnupg
        pkgs.hello
        pkgs.htop
        pkgs.jq
        pkgs.pass
        pkgs.shellcheck
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