{ pkgs, ... }: {
    home.packages = [ 
        pkgs.htop
        pkgs.hello
    ];
}