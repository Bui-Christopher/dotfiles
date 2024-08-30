{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      # TODO: Check Opinion: disable global registry
      flake-registry = "";
    };
    gc = {
      automatic = true;
      dates = "weekly"; # Include the results of the hardware scan.
      options = "--delete-older-than 1w";
    };
    # channel.enable = false;
  };

  # Enable networking
  networking.hostName = "oven"; # Define your hostname.
  networking.networkmanager.enable = true;

  programs.zsh.enable = true;
  users.users = {
      cookie = {
          isNormalUser = true;
          extraGroups = [ "networkmanager" "wheel" ];
          # TODO: Add public ssh keys
          # openssh.authorizedKeys.keys = [
          # ];
          shell = pkgs.zsh;
          packages = with pkgs; [
            firefox
            git
            # wezterm
          ];
      };
  };
  home-manager = {
      extraSpecialArgs = {inherit inputs;};
      # useGlobalPkgs = true;
      # useUserPackages = true;
      users.cookie = import ../home.nix;
  };

  # TODO: Explore customizations below
  # Does bootloader and time zone go here..?
  # What about these local settings

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # services.openssh = {
  #   enable = true;
  # };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    nix-prefetch-git
    xclip
    pinentry-curses
  ];
  environment.variables.EDITOR = "vim";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05"; # Did you read the comment?

}
