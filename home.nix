{ config, pkgs, inputs, ... }:

{
    #imports = [ inputs.nixvim.homeManagerModules.nixvim ];
	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "lucy";
	home.homeDirectory = "/home/lucy";

	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "24.11"; # Please read the comment before changing.

	# The home.packages option allows you to install Nix packages into your
	# environment.

	# Home Manager is pretty good at managing dotfiles. The primary way to manage
	# plain files is through 'home.file'.
	home.file = {
		# # Building this configuration will create a copy of 'dotfiles/screenrc' in
		# # the Nix store. Activating the configuration will then make '~/.screenrc' a
		# # symlink to the Nix store copy.
		# ".screenrc".source = dotfiles/screenrc;

		# # You can also set the file content immediately.
		# ".gradle/gradle.properties".text = ''
		#   org.gradle.console=verbose
		#   org.gradle.daemon.idletimeout=3600000
		# '';
	};

	# Home Manager can also manage your environment variables through
	# 'home.sessionVariables'. These will be explicitly sourced when using a
	# shell provided by Home Manager. If you don't want to manage your shell
	# through Home Manager then you have to manually source 'hm-session-vars.sh'
	# located at either
	#
	#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  /etc/profiles/per-user/lucy/etc/profile.d/hm-session-vars.sh
	#
	

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;


	#programs.fish.enable = true;
	#programs.fish.shellAliases = {
#	"neofetch" = "hyfetch";
 # }

	programs.fish = {
	    enable = true;
	    shellAliases = {
		    "neofetch" = "hyfetch";
	    };
	    
	};
	
    nixpkgs.config = {
	    allowUnfree = true;
	};

	home.packages = with pkgs; [
	    yt-dlp
	    neofetch
	    hyfetch
	    audacious
	    gimp
	    obs-studio
	    flameshot
	    inkscape
	    ffmpeg
	    vlc
	    mpv
        vscode
	wofi
	htop
	protontricks
	winetricks
	cava
	vesktop
	gamescope
	nnn
	ouch
      ];

      #environment.variables.EDITOR = "nvim";

      programs.neovim = {
	enable = true;
	viAlias = true;
	vimAlias = true;

	plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
	extraPackages = with pkgs; [ lua-language-server rust-analyzer ];
      };

 #     services.hyprpaper = {
#		enable = true;
#		settings = {
#			preload = [ "/home/lucy/Pictures/wall.png" ];
#			ipc = "on";
#
#			wallpaper = [ "DP-1,/home/lucy/Pictures/wall.png" "DP-2,/home/lucy/Pictures/wall.png"];
#		};
	#
      #};

      home.file.".config/kitty/kitty.conf".source = ./home/config/kitty/kitty.conf;
      home.file.".config/kitty/rose-pine-moon.conf".source = ./home/config/kitty/rose-pine-moon.conf;

      home.file.".config/hypr/hyprland.conf".source = ./home/config/hypr/hyprland.conf;
      home.file.".config/hypr/hyprpaper.conf".source = ./home/config/hypr/hyprpaper.conf;

      home.file.".config/waybar/config.jsonc".source = ./home/config/waybar/config.jsonc;
      home.file.".config/waybar/style.css".source = ./home/config/waybar/style.css;
      home.file.".config/waybar/rose-pine-moon.css".source = ./home/config/waybar/rose-pine-moon.css;

	home.file.".config/fish/functions/fish_prompt.fish".source = ./home/config/fish/functions/fish-prompt.fish;
	home.file.".config/fish/functions/n.fish".source = ./home/config/fish/functions/n.fish;
	home.file.".config/fish/config.fish".source = ./home/config/fish/config.fish;

	home.file.".config/cava/config".source = ./home/config/cava/config;

	home.file.".config/wofi/style.css".source = ./home/config/wofi/style.css;
	home.file.".config/wofi/config".source = ./home/config/wofi/config;
	
	home.file.".config/xdg-desktop-portal/hyprland-portals.conf".source = ./home/config/xdg-desktop-portal/hyprland-portals.conf;

	home.file.".config/nvim" = { source = ./home/config/nvim; recursive = true; };
	#programs.fish.functions.fish_prompt = {
#	body = ''
#
#
#
#	'';
#	};

}
