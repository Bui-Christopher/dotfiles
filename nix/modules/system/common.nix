{ pkgs, ... }:

{
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.efi.canTouchEfiVariables = true;

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
}
