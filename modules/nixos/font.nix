{ config, pkgs, inputs, ... }:
{
    #i18n.consoleKeyMap = "us";
    console.keyMap = "us";
    console.font = "Lat2-Terminus16";
    #i18n.consoleFont = "Lat2-Terminus16";

    #i listen to japanese music every now and then therefore i need the cjk fonts to work
    fonts.packages = with pkgs; [
	    noto-fonts
	    noto-fonts-cjk-sans
	    noto-fonts-cjk-serif
	    notonoto
	    noto-fonts-emoji
	    nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig.defaultFonts = {
	    monospace = [ "JetBrainsMono NFM" "NOTONOTO Console" ];
	    sansSerif = [ "Noto Sans" "Noto Sans CJK" ];
	    serif = [ "Noto Serif" "Noto Serif CJK" ];
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
	    LC_ADDRESS = "en_US.UTF-8";
	    LC_IDENTIFICATION = "en_US.UTF-8";
	    LC_MEASUREMENT = "en_US.UTF-8";
	    LC_MONETARY = "en_US.UTF-8";
	    LC_NAME = "en_US.UTF-8";
	    LC_NUMERIC = "en_US.UTF-8";
	    LC_PAPER = "en_US.UTF-8";
	    LC_TELEPHONE = "en_US.UTF-8";
	    LC_TIME = "en_US.UTF-8";
    };
}
