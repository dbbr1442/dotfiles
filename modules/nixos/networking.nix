{ config, pkgs, inputs, ... }:
{
    networking.hostName = "internal-nix"; # Define your hostname.
    networking.networkmanager.enable = true;
    
    # required for kde connect 
    networking.firewall = {
        enable = true;
        allowedUDPPortRanges = [
            { from = 1714; to = 1764; }
        ];
    };
}
