{inputs, pkgs, ...}:

{
    imports = [];
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    services.libinput.enable = true;
    services.xserver.libinput.naturalScrolling = true;

    programs.hyprland = {
        enable = true;
        # set the flake package
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        # make sure to also set the portal package, so that they are in sync
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
}
