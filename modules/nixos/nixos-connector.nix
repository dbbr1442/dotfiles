{ config, pkgs, inputs, ... }:
{
    ## this assumes the position of configuration.nix from my previous nix config

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "24.11"; # Did you read the comment? NEVER CHANGE THIS THERE IS NO NEED TO
    nix.settings.experimental-features = [ "nix-command" "flakes"];

    imports = [
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.default
        ./boot.nix
        ./desktop.nix
        ./font.nix
        ./graphics.nix
        ./misc.nix
        ./networking.nix
        ./programs.nix
        ./security.nix
        ./users.nix
        ./single-gpu-passthrough.nix
    ];


}
