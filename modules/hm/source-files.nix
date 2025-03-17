{ config, pkgs, inputs, ... }:
#let
#  home-files-source = ./source-files-directory/home;
#in 
{

    home.file = {
        ".config/kitty/kitty.conf".source = ./source-files-directory/home/config/kitty/kitty.conf;
        #".config/kitty/theme.conf".source = ./source-files-directory/home/config/kitty/theme.conf;
        

        ".config/hypr/hyprland.conf".source = ./source-files-directory/home/config/hypr/hyprland.conf;
        ".config/hypr/hyprpaper.conf".source = ./source-files-directory/home/config/hypr/hyprpaper.conf;
        ".config/hypr/hypridle.conf".source = ./source-files-directory/home/config/hypr/hypridle.conf;

        ".config/waybar/config.jsonc".source = ./source-files-directory/home/config/waybar/config.jsonc;
        ".config/waybar/style.css".source = ./source-files-directory/home/config/waybar/style.css;
        ".config/waybar/theme.css".source = ./source-files-directory/home/config/waybar/theme.css;

        ".config/fish/functions/fish_prompt.fish".source = ./source-files-directory/home/config/fish/functions/fish-prompt.fish;
        ".config/fish/functions/n.fish".source = ./source-files-directory/home/config/fish/functions/n.fish;
        ".config/fish/functions/ffmpeg-trim.fish".source = ./source-files-directory/home/config/fish/functions/ffmpeg-trim.fish;
        ".config/fish/functions/restart-waybar.fish".source = ./source-files-directory/home/config/fish/functions/restart-waybar.fish;
        ".config/fish/functions/yt-dlp-preset.fish".source = ./source-files-directory/home/config/fish/functions/yt-dlp-preset.fish;

        ".config/cava/config".source = ./source-files-directory/home/config/cava/config;

        ".config/wofi/style.css".source = ./source-files-directory/home/config/wofi/style.css;
        ".config/wofi/config".source = ./source-files-directory/home/config/wofi/config;


        ".config/nvim" = { source = ./source-files-directory/home/config/nvim; recursive = true; };

        ".config/cmus/theme.theme".source = ./source-files-directory/home/config/cmus/theme.theme;
        ".config/fish/functions/set-wallpaper.fish".source = ./source-files-directory/home/config/fish/functions/set-wallpaper.fish;
       # ".config/gtk-2.0" = { source = ./source-files-directory/home/config/gtk-2.0; recursive = true; }; 
       # ".config/gtk-3.0" = { source = ./source-files-directory/home/config/gtk-3.0; recursive = true; };
       # ".config/gtk-4.0" = { source = ./source-files-directory/home/config/gtk-4.0; recursive = true; };
        #".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
        #".icons/default".source = "${pkgs.rose-pine-cursor}/share/icons/BreezeX-RoséPine";
        ".config/lf/lfrc".source = ./source-files-directory/home/config/lf/lfrc;
        ".config/lf/cleaner".source = ./source-files-directory/home/config/lf/cleaner;
        ".config/lf/preview".source = ./source-files-directory/home/config/lf/preview;
        #".config/fish/functions/other" = { source = ./source-files-directory/home/config/fish/functions/other; recursive = true; };
        ".config/fish/functions/lfub.fish".source = ./source-files-directory/home/config/fish/functions/lfub.fish;
        ".config/fish/functions/lfc.fish".source = ./source-files-directory/home/config/fish/functions/lfc.fish;
        #".config/lf/lfub/lfub".source = ./source-files-directory/home/config/lf/lfub/lfub;
        ".config/dunst/dunstrc.d/50-theme.conf".source = ./source-files-directory/home/config/dunst/dunstrc.d/50-theme.conf;
        ".icons/rose-pine-moon-icons".source = "${pkgs.rose-pine-icon-theme}/share/icons/rose-pine-moon";
        #".themes/rose-pine-moon-gtk".source = "${pkgs.rose-pine-gtk-theme}/share/themes/rose-pine-moon";

	};


#    home.file = {
#        ".config/kitty/kitty.conf".source = ${home-files-source}/config/kitty/kitty.conf;
#        ".config/kitty/theme.conf".source = ${home-files-source}/config/kitty/theme.conf;
#        
#
#        ".config/hypr/hyprland.conf".source = ${home-files-source}/config/hypr/hyprland.conf;
#        ".config/hypr/hyprpaper.conf".source = ${home-files-source}/config/hypr/hyprpaper.conf;
#        ".config/hypr/hypridle.conf".source = ${home-files-source}/config/hypr/hypridle.conf;
#
#        ".config/waybar/config.jsonc".source = ${home-files-source}/config/waybar/config.jsonc;
#        ".config/waybar/style.css".source = ${home-files-source}/config/waybar/style.css;
#        ".config/waybar/theme.css".source = ${home-files-source}/config/waybar/theme.css;
#
#        ".config/fish/functions/fish_prompt.fish".source = ${home-files-source}/config/fish/functions/fish-prompt.fish;
#        ".config/fish/functions/n.fish".source = ${home-files-source}/config/fish/functions/n.fish;
#        ".config/fish/functions/ffmpeg-trim.fish".source = ${home-files-source}/config/fish/functions/ffmpeg-trim.fish;
#        ".config/fish/functions/restart-waybar.fish".source = ${home-files-source}/config/fish/functions/restart-waybar.fish;
#        ".config/fish/functions/yt-dlp-preset.fish".source = ${home-files-source}/config/fish/functions/yt-dlp-preset.fish;
#
#        ".config/cava/config".source = ${home-files-source}/config/cava/config;
#
#        ".config/wofi/style.css".source = ${home-files-source}/config/wofi/style.css;
#        ".config/wofi/config".source = ${home-files-source}/config/wofi/config;
#
#
#        ".config/nvim" = { source = ${home-files-source}/config/nvim; recursive = true; };
#
#        ".config/cmus/theme.theme".source = ${home-files-source}/config/cmus/theme.theme;
#        ".config/fish/functions/set-wallpaper.fish".source = ${home-files-source}/config/fish/functions/set-wallpaper.fish;
#       # ".config/gtk-2.0" = { source = ${home-files-source}/config/gtk-2.0; recursive = true; }; 
#       # ".config/gtk-3.0" = { source = ${home-files-source}/config/gtk-3.0; recursive = true; };
#       # ".config/gtk-4.0" = { source = ${home-files-source}/config/gtk-4.0; recursive = true; };
#        #".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
#        #".icons/default".source = "${pkgs.rose-pine-cursor}/share/icons/BreezeX-RoséPine";
#        ".config/lf/lfrc".source = ${home-files-source}/config/lf/lfrc;
#        ".config/lf/cleaner".source = ${home-files-source}/config/lf/cleaner;
#        ".config/lf/preview".source = ${home-files-source}/config/lf/preview;
#        #".config/fish/functions/other" = { source = ${home-files-source}/config/fish/functions/other; recursive = true; };
#        ".config/fish/functions/lfub.fish".source = ${home-files-source}/config/fish/functions/lfub.fish;
#        ".config/fish/functions/lfc.fish".source = ${home-files-source}/config/fish/functions/lfc.fish;
#        #".config/lf/lfub/lfub".source = ${home-files-source}/config/lf/lfub/lfub;
#        ".config/dunst/dunstrc.d/50-theme.conf".source = ${home-files-source}/config/dunst/dunstrc.d/50-theme.conf;
#        ".icons/rose-pine-moon-icons".source = "${pkgs.rose-pine-icon-theme}/share/icons/rose-pine-moon";
#        #".themes/rose-pine-moon-gtk".source = "${pkgs.rose-pine-gtk-theme}/share/themes/rose-pine-moon";
#    };

}
