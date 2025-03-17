{ config, pkgs, inputs, ... }:
{
    ##this config sets the cursor theme for gtk and the desktop in general as well as the icon theme and other options

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
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
        iconTheme = { package = pkgs.rose-pine-icon-theme; name = "rose-pine-moon-icons"; };
      };

}
