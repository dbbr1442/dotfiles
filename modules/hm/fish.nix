{ config, pkgs, inputs, ... }:

{
	programs.fish = {
	    enable = true;
	    shellAliases = {
		    "neofetch" = "hyfetch";
	    };
	    shellInit = ''
            set -x EDITOR nvim
        '';
	    
	};
}
