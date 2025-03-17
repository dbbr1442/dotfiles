{ config, pkgs, inputs, ... }:
{
    services.displayManager.ly.enable = true;

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    services.pipewire = {
	    enable = true;
	    alsa.enable = true;
	    alsa.support32Bit = true;
	    pulse.enable = true;
    };
}
