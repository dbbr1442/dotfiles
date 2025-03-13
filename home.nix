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
        ".config/kitty/kitty.conf".source = ./home/config/kitty/kitty.conf;
        ".config/kitty/theme.conf".source = ./home/config/kitty/theme.conf;

        ".config/hypr/hyprland.conf".source = ./home/config/hypr/hyprland.conf;
        ".config/hypr/hyprpaper.conf".source = ./home/config/hypr/hyprpaper.conf;
        ".config/hypr/hypridle.conf".source = ./home/config/hypr/hypridle.conf;

        ".config/waybar/config.jsonc".source = ./home/config/waybar/config.jsonc;
        ".config/waybar/style.css".source = ./home/config/waybar/style.css;
        ".config/waybar/theme.css".source = ./home/config/waybar/theme.css;

        ".config/fish/functions/fish_prompt.fish".source = ./home/config/fish/functions/fish-prompt.fish;
        ".config/fish/functions/n.fish".source = ./home/config/fish/functions/n.fish;
        ".config/fish/functions/ffmpeg-trim.fish".source = ./home/config/fish/functions/ffmpeg-trim.fish;
        ".config/fish/functions/restart-waybar.fish".source = ./home/config/fish/functions/restart-waybar.fish;
        ".config/fish/functions/yt-dlp-preset.fish".source = ./home/config/fish/functions/yt-dlp-preset.fish;

        ".config/cava/config".source = ./home/config/cava/config;

        ".config/wofi/style.css".source = ./home/config/wofi/style.css;
        ".config/wofi/config".source = ./home/config/wofi/config;


        ".config/nvim" = { source = ./home/config/nvim; recursive = true; };

        ".config/cmus/theme.theme".source = ./home/config/cmus/theme.theme;
        ".config/fish/functions/set-wallpaper.fish".source = ./home/config/fish/functions/set-wallpaper.fish;
        ".config/gtk-2.0" = { source = ./home/config/gtk-2.0; recursive = true; }; 
        ".config/gtk-3.0" = { source = ./home/config/gtk-3.0; recursive = true; };
        ".config/gtk-4.0" = { source = ./home/config/gtk-4.0; recursive = true; };
        ".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
        #".icons/default".source = "${pkgs.rose-pine-cursor}/share/icons/BreezeX-RoséPine";

        ".config/lf/lfrc".source = ./home/config/lf/lfrc;
        ".config/ctpv/config".source = ./home/config/ctpv/config;
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
	    shellInit = "set -x EDITOR nvim";
	    
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
        blender
        librewolf
        cmus
        android-file-transfer
        rawtherapee
        vanilla-dmz
        chafa
        #rose-pine-cursor
        lf
      ];

        programs.lf = {
          previewer = {
            keybinding = "i";
            source = "${pkgs.ctpv}/bin/ctpv";
          };
          extraConfig = ''
            &${pkgs.ctpv}/bin/ctpv -s $id
            cmd on-quit %${pkgs.ctpv}/bin/ctpv -e $id
            set cleaner ${pkgs.ctpv}/bin/ctpvclear
          '';
        }


      home.pointerCursor = {
          x11.enable = true;
          size = 24;
          package = pkgs.vanilla-dmz;
          name = "Vanilla-DMZ";
          #package = pkgs.rose-pine-cursor;
          #name = "BreezeX-RoséPine";
          gtk.enable = true;
      };

      gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.vanilla-dmz;
            name = "Vanilla-DMZ";
            #package = pkgs.rose-pine-cursor;
            #name = "BreezeX-RoséPine";
            size = 24;
        };
      };

      #environment.variables.EDITOR = "nvim";

    programs.gallery-dl = {
      enable = true;
      settings = {
        extractor.base-directory = "~/Pictures/pinterest";
      };
    };

      programs.neovim = {
	enable = true;
	viAlias = true;
	vimAlias = true;

	plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
	extraPackages = with pkgs; [ lua-language-server rust-analyzer clang-tools ];
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

	#programs.fish.functions.fish_prompt = {
#	body = ''
#
#
#
#	'';
#	};

}
