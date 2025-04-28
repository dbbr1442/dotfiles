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
    hardware.graphics = {
	    enable = true;
        extraPackages = with pkgs; [
            libva-utils
            vdpauinfo
		    libvdpau-va-gl
            nvidia-vaapi-driver
            vaapiVdpau
            libva-vdpau-driver
            libva
            nv-codec-headers-12
	    ];
    };
    environment.variables = {
        #NVD_BACKEND = "direct";
        #LIBVA_DRIVER_NAME = "nvidia";
        VDPAU_DRIVER = "nvidia";
        LIBVA_DRIVER_NAME = "nvidia";
        NVD_BACKEND = "direct";
    };

    # this installs packages required for hardware acceleration
    environment.systemPackages = [
        pkgs.ffmpeg-full
        pkgs.nv-codec-headers-12
        pkgs.libva-vdpau-driver
        pkgs.libva
        pkgs.libva-utils
        pkgs.vdpauinfo
        pkgs.nvidia-vaapi-driver
        pkgs.libvdpau-va-gl
    ];

    # allow wayland to use the nvidia drivers
    services.xserver.videoDrivers = ["nvidia"];
    boot.kernelModules = [ "nvidia-uvm" "nvidia-drm" "nvidia" "nvidia_modeset" ];
    boot.blacklistedKernelModules = [ "nouveau" ];
	boot.kernelParams = [ "nvidia.NVReg_EnableGpuFirmware=0" "nvidia-drm.modeset=1" ];
}
