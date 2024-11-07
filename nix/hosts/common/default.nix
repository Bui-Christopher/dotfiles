{ lib, pkgs, ... }:

{
    imports = [
        ./display.nix
    ];
    # Networking
    networking.networkmanager.enable = true;

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
    # SSH
    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = false;
    };

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.efi.canTouchEfiVariables = true;

    # TimeZone and Locale
    time.timeZone = "America/Los_Angeles";
    i18n.defaultLocale = "en_US.UTF-8";

    # Sound
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;
    };

    # GnuPG
    services.pcscd.enable = true;
    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = lib.mkForce pkgs.pinentry-curses;
        enableSSHSupport = true;
    };

    environment.systemPackages = with pkgs; [
        curl
        wget

        git
        pinentry-curses
        vim

        htop
        nvtopPackages.full
        btop

        # rustup
        # cargo
        # rustc
    ];

}
