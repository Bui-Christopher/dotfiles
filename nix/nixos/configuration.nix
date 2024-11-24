{ ... }:

{
    imports = [];
    nixpkgs.config.allowUnfree = true;
    nix = {
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
            flake-registry = "";

            # Hyprland Cachix: https://wiki.hyprland.org/Nix/Cachix/
            substituters = ["https://hyprland.cachix.org"];
            trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        };
        gc = {
            automatic = true;
            dates = "weekly"; # Include the results of the hardware scan.
            options = "--delete-older-than 1w";
        };
    };
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.05"; # Did you read the comment?

}
