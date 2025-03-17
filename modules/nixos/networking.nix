{ config, pkgs, inputs, ... }:
{
    networking.hostName = "internal-nix"; # Define your hostname.
    networking.networkmanager.enable = true;
}
