# NOTE: Gnome is commented out and not currently being used.
{ pkgs, ... }:

{
    imports = [];
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.libinput.enable = true;
    services.xserver.libinput.naturalScrolling = true;

    environment.systemPackages = with pkgs; [
        xclip # For x11
        # gnome-control-center
        # gnome-settings-daemon
    ];
    programs.waybar = {
        enable = true;
    };

}
