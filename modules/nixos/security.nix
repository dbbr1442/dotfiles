{ config, pkgs, inputs, ... }:
{
    security.rtkit.enable = true;
    security.sudo.wheelNeedsPassword = false;
    security.polkit.enable = true;
}
