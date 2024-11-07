{ pkgs, ... }:

{
    imports = [];
    # X11
    services.xserver.enable = true;
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.libinput.enable = true;

    environment.systemPackages = with pkgs; [
        # For x11
        xclip
    ];

}
