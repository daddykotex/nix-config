{ config,
  sources ? import ./nix/sources.nix,
  pkgs ? import sources.nixpkgs {},
  home-manager, 
  ...
}:
{
  imports = [ <home-manager/nix-darwin> ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users."David.Francoeur" = {
      imports = [ ./home.nix ];
    };
  };

  # See https://daiderd.com/nix-darwin/manual/index.html

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  programs.fish = {
    enable = true;
    vendor.completions.enable = true;
  };
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
