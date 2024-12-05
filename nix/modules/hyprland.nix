{inputs, pkgs, ...}:

{
    imports = [];
    services.xserver.enable = true;
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
    # NOTE: Using hyprlock instead
    # services.xserver.displayManager.gdm.enable = true;

    services.libinput.enable = true;
    services.libinput.touchpad.naturalScrolling = true;

    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
}
