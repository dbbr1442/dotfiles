function restart-waybar
    command pkill waybar && hyprctl dispatch exec waybar
end
