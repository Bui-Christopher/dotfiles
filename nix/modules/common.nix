{ inputs, pkgs, ... }:

{
    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.efi.canTouchEfiVariables = true;

    # Power Keys
    services.logind.extraConfig = ''
        # Don’t shutdown when power button is short-pressed
        HandlePowerKey=suspend
        HandlePowerKeyLongPress=poweroff

        # Continue listening to music while laptop is closed
        LidSwitchIgnoreInhibited=no
    '';

    # GnuPG
    services.pcscd.enable = true;
    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;
        enableSSHSupport = true;
    };

    # Networking
    networking.networkmanager.enable = true;

    # Packages
    environment.systemPackages = with pkgs; [
        # Compression
        unzip
        xz
        zip

        # Encryption
        gnupg
        pinentry-curses

        # File
        file
        which

        # Networking
        curl
        wget

        # Shell
        bash
        zsh

        # Version Control
        git

        # Editor
        vim

        # System Monitoring
        btop
        htop
        neofetch
    ];
    # Bluetooth
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

    # Sound
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
    };

    # SSH
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
    };

    # TimeZone and Locale
    time.timeZone = "America/Los_Angeles";
    i18n.defaultLocale = "en_US.UTF-8";

    # User
    programs.zsh.enable = true;
    users.users = {
        cookie = {
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" ];
            shell = pkgs.zsh;
            openssh.authorizedKeys.keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICcjWKR6+Wv49HA5DB6sRuVAfK6Tnnu7O9yvpnRMUkkc"
            ];
        };
    };

    # Desktop Environment (Hypr)
    services.xserver.enable = true;
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    services.libinput.enable = true;
    services.libinput.touchpad.naturalScrolling = true;

    ## Hyprland
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    ## Hyprlock
    programs.hyprlock.enable = true;
}
