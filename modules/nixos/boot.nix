{ config, pkgs, inputs, ... }:
{
    ## i dual boot nixos and windows however i have an unusual partition scheme that requires the use of grub over systemd boot
    # Bootloader.
    boot.loader = { 
        efi.canTouchEfiVariables = true;
        grub = {
		    enable = true;
		    devices = ["nodev"];
		    efiSupport = true;
		    useOSProber = true;
	    };
    };
    boot.supportedFilesystems = [ "ntfs" ];

    # https://nixos.wiki/wiki/OBS_Studio
    boot.extraModulePackages = with config.boot.kernelPackages; [
        v4l2loopback
        ddcci-driver
    ];
    boot.extraModprobeConfig = ''
        options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    services.udev.enable = true;
    services.udev.extraRules = ''
        KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';

    boot.kernelModules = ["i2c-dev" "ddcci_backlight" "v4l2loopback" ];
}
