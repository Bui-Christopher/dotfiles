# Nix Settings and Cachix
{ ... }:

{
    nixpkgs.config.allowUnfree = true;
    nix = {
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
            flake-registry = "";

            # Hyprland Cachix: https://wiki.hyprland.org/Nix/Cachix/
            # Wezterm Cachix: https://wezfurlong.org/wezterm/install/linux.html#cachix
            substituters = [
                "https://hyprland.cachix.org"
                "https://wezterm.cachix.org"
            ];
            trusted-public-keys = [
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
                "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
            ];
            trusted-users = [ "root" "cookie" "@wheel"];
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
