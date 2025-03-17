{ config, pkgs, inputs, ... }:
{
    users.users.lucy = {
	    isNormalUser = true;
	    description = "lucy";
	    extraGroups = [ "networkmanager" "wheel" "i2c" ];
	    shell = pkgs.fish;
    };

    home-manager = {
	    extraSpecialArgs = { inherit inputs; };
	    users = {
		    "lucy" = import ./../hm/hm-connector.nix;
	    };
        backupFileExtension = "bak";
    };
}
