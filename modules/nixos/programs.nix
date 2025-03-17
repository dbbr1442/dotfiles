{ config, pkgs, inputs, ... }:
{
    environment.systemPackages = [
	    pkgs.wget
	    pkgs.git
	    pkgs.kdePackages.powerdevil
	    pkgs.kdePackages.sddm-kcm
	    pkgs.ddcutil
	    pkgs.xdg-desktop-portal
	    pkgs.kdePackages.xdg-desktop-portal-kde
	    pkgs.libvlc
	    pkgs.libva
	    pkgs.libva-vdpau-driver
	    pkgs.xclip
	    pkgs.kitty
	    pkgs.hyprpaper
	    pkgs.playerctl
	    pkgs.hyprpolkitagent
	    pkgs.wl-clip-persist
	    pkgs.wl-clipboard
	    pkgs.cliphist
	    pkgs.waybar
	    pkgs.waybar-mpris
	    pkgs.networkmanagerapplet
	    pkgs.slurp
	    pkgs.grim
        pkgs.hypridle
        pkgs.hyprlock
        pkgs.dunst
        pkgs.SDL2
        #pkgs.steam
        pkgs.firefox
    ];

    programs.hyprland.enable = true;
    programs.steam.enable = true;
    
    programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-vkcapture
        ];
    };
}
