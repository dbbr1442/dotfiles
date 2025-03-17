function set-wallpaper
    set WALLPAPER (find ~/Pictures/wallpapers/wallpaper.*)
    command hyprctl hyprpaper reload ,"$WALLPAPER"
end
