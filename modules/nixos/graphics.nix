{ config, pkgs, inputs, ... }:
{   
    # this enables the nvidia drivers
    hardware.nvidia = {
        modesetting.enable = true;
	    powerManagement.enable = false;
	    powerManagement.finegrained = false;
	    open = false;
	    nvidiaSettings = true;
	    package = config.boot.kernelPackages.nvidiaPackages.beta;
	};

    # this enables hardware acceleration / it enables h264 in obs
    nixpkgs.config.packageOverrides = pkgs: {
        intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
    };

    hardware.graphics = { 
	    enable = true;
        extraPackages = with pkgs; [
            libva-utils
            vdpauinfo
            #intel-media-driver
		    libvdpau-va-gl
            nvidia-vaapi-driver
            vaapiVdpau
	    ];
    };
    environment.variables = {
        NVD_BACKEND = "direct";
        LIBVA_DRIVER_NAME = "nvidia";
    };

    # this installs ffmpeg
    environment.systemPackages = [
        pkgs.ffmpeg-full
        pkgs.nv-codec-headers-12
    ];

    # allow wayland to use the nvidia drivers
    services.xserver.videoDrivers = ["nvidia"];
}
