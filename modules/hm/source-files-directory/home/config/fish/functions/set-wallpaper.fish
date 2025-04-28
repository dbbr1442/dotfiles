function set-wallpaper -a wallpaper
    #set WALLPAPER (find ~/Pictures/wallpapers/wallpaper.*)
    command hyprctl hyprpaper reload ,"$wallpaper"
end

