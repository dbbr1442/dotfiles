{ config, pkgs, inputs, ... }:
{
    ##this is a critical component of the configuration as it allows me to download my mental illness pictures on mass
    programs.gallery-dl = {
        enable = true;
        settings = {
            extractor.base-directory = "~/Pictures/pinterest";
        };
    };
}
