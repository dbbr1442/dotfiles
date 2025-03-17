{ config, pkgs, inputs, ... }:
{
    time.timeZone = "America/Denver";
    services.printing.enable = true;
}
