{ pkgs, ... }:

{
    imports = [];
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.libinput.enable = true;
    services.xserver.libinput.naturalScrolling = true;

    environment.systemPackages = with pkgs; [
        # For x11
        xclip
        # gnome-control-center
        # gnome-settings-daemon
    ];

}
