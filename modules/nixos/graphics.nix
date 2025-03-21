{ config, pkgs, inputs, ... }:
{
    hardware.nvidia = {
        modesetting.enable = true;
	    powerManagement.enable = false;
	    powerManagement.finegrained = false;
	    open = false;
	    nvidiaSettings = true;
	    package = config.boot.kernelPackages.nvidiaPackages.beta;
	};

    hardware.graphics = { 
	    enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
}
