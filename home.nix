{ config, pkgs, inputs, ... }:

{
    imports = [ inputs.nixvim.homeManagerModules.nixvim ];
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
	home.sessionVariables = {
		# EDITOR = "emacs";
	};

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
	    #discord
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
        #neovim
      ];

      programs.nixvim.enable = true;

      programs.nixvim = {
	extraConfigLua = ''vim.opt.clipboard="unnamedplus"'';
      
      	colorschemes.rose-pine = {
		enable = true;
		settings = {
			dark_variant = "moon";
			#transparency = true;
			styles = { bold = true; italic = true; transparency = true; };
		};
	};

	plugins.treesitter = { enable = true; };
	plugins.cmp = { 
		enable = true;
		autoEnableSources = true;
		settings.sources = [
			{ name = "nvim_lsp"; }
			{ name = "path"; }
			{ name = "cmdline"; }
			{ name = "luasnip"; }
		];
		settings.mapping.__raw = ''
			cmp.mapping.preset.insert({
			["<Tab>"] = cmp.mapping(function(fallback)
            		-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            		if cmp.visible() then
                		local entry = cmp.get_selected_entry()
                		if not entry then
                    			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                		end
                		cmp.confirm()
            		else
                		fallback()
            		end
        		end, {"i","s","c",}),

        		['<Down>'] = cmp.mapping.select_next_item(),
        		['<Up>'] = cmp.mapping.select_prev_item(),
        		['<Esc>'] = cmp.mapping.abort(),

			--['<C-f>'] = cmp_action.luasnip_jump_forward(),
        		--['<C-b>'] = cmp_action.luasnip_jump_backward(),

			})
		'';
		settings.snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
	};
	plugins.cmp-cmdline.enable = true;
	plugins.cmp-nvim-lsp.enable = true;
	plugins.lsp = { 
		enable = true;
		servers = {
			clangd.enable = true;
			lua_ls.enable = true;
		};
	};
	plugins.luasnip.enable = true;

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

      ####todo 
      #source ~/.config/waybar/config.jsonrc so its managed by hm
      #fix nixvim

      home.file.".config/kitty/kitty.conf".source = ./home/config/kitty/kitty.conf;
      home.file.".config/kitty/rose-pine-moon.conf".source = ./home/config/kitty/rose-pine-moon.conf;

      home.file.".config/hypr/hyprland.conf".source = ./home/config/hypr/hyprland.conf;
      home.file.".config/hypr/hyprpaper.conf".source = ./home/config/hypr/hyprpaper.conf;

      home.file.".config/waybar/config.jsonc".source = ./home/config/waybar/config.jsonc;
      home.file.".config/waybar/style.css".source = ./home/config/waybar/style.css;
      home.file.".config/waybar/rose-pine-moon.css".source = ./home/config/waybar/rose-pine-moon.css;

	home.file.".config/fish/functions/fish_prompt.fish".source = ./home/config/fish/functions/fish-prompt.fish;
	home.file.".config/fish/functions/n.fish".source = ./home/config/fish/functions/n.fish;

	home.file.".config/cava/config".source = ./home/config/cava/config;

	home.file.".config/wofi/style.css".source = ./home/config/wofi/style.css;
	
	home.file.".config/xdg-desktop-portal/hyprland-portals.conf".source = ./home/config/xdg-desktop-portal/hyprland-portals.conf;
	#programs.fish.functions.fish_prompt = {
#	body = ''
#
#
#
#	'';
#	};

}
