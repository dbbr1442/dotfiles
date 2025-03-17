{ config, pkgs, inputs, ... }:
{
    home.stateVersion = "24.11";  
	programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    imports = [
        ./fish.nix
        ./user.nix
        ./neovim.nix
        ./programs.nix
        ./gallery-dl.nix
        ./gtk-config.nix
        ./source-files.nix
    ];
}
