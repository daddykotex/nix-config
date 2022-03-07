{ pkgs, ... }: {
    home.packages = [ 
        pkgs.htop
        pkgs.hello
        pkgs.shellcheck
        pkgs.direnv
    ];
}