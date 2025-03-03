# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
	  ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.default
	];

  # Bootloader.
  boot.loader = { 
  	#systemd-boot.enable = true;
  	efi.canTouchEfiVariables = true;
	grub = {
		enable = true;
		devices = ["nodev"];
		efiSupport = true;
		useOSProber = true;
	};
};
  boot.supportedFilesystems = [ "ntfs" ];

security.sudo.wheelNeedsPassword = false;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  i18n.consoleKeyMap = "us";
  i18n.consoleFont = "Lat2-Terminus16";

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

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.displayManager.sddm.settings = {
	Theme = {
		Current = "breeze";
		ThemeDir = "/sddmt";
	};
  };

  # Configure keymap in X11
  services.xserver.xkb = {
	layout = "us";
	variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	# If you want to use JACK applications, uncomment this
	#jack.enable = true;

	# use the example session manager (no others are packaged yet so this is enabled by default,
	# no need to redefine it in your config for now)
	#media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucy = {
	isNormalUser = true;
	description = "lucy";
	extraGroups = [ "networkmanager" "wheel" "i2c" ];
	shell = pkgs.fish;
	packages = with pkgs; [
	  kdePackages.kate
	#  thunderbird
	];
  };

  home-manager = {
	extraSpecialArgs = { inherit inputs; };
	users = {
		"lucy" = import ./home.nix;
	};
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #hardware.opengl = {
  #	enable = true;
#	driSupport = true;
#	driSupport32Bit = true;
#	};
services.xserver.videoDrivers = ["nvidia"];

hardware.graphics = { 
	enable = true;
	extraPackages = with pkgs; [
		libvdpau-va-gl

	];
};

#services.xserver.videoDrivers = ["nvidia"];

hardware.nvidia = {
  modesetting.enable = true;
	powerManagement.enable = false;
	powerManagement.finegrained = false;
	open = false;
	nvidiaSettings = true;
	package = config.boot.kernelPackages.nvidiaPackages.beta;
	};

programs.steam.enable = true;
#programs.nixvim.enable = true;



  #services.xserver.videoDrivers = ["nvidia"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	wget
	git
  	#neofetch
	#hyfetch
  	#neovim
	#audacious
	#gimp
	#libgcc
	#nerdfonts
	#gcc
	#libvlc
	#flameshot
	kdePackages.powerdevil
	kdePackages.sddm-kcm
	ddcutil
	xdg-desktop-portal
	kdePackages.xdg-desktop-portal-kde
	libvlc
	libva
	libva-vdpau-driver
	xclip
	kitty
	hyprpaper
	playerctl
	hyprpolkitagent
	wl-clip-persist
	wl-clipboard
	cliphist
	waybar
	waybar-mpris
	networkmanagerapplet
	slurp
	grim
    hypridle
    hyprlock
    dunst
    SDL2
	#wine-staging
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-vkcapture
    ];
  };
    

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
  security.polkit.enable = true;

  programs.hyprland.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes"];

}
