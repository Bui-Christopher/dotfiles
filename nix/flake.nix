{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home Manager
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Hyprland
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        # NixVim
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # Wezterm
        wezterm = {
            url = "github:wez/wezterm?dir=nix";
        };

        # Fenix
        # NOTE:https://github.com/nix-community/fenix
        # Fenix is for using nightly rustc and cargo (nixpkgs uses stable)
        # It replaces rustup, but I'd like to exclusively use development shells instead
        # fenix = {
        #     url = "github:nix-community/fenix";
        #     inputs.nixpkgs.follows = "nixpkgs";
        # };
    };

    outputs = { nixpkgs, ... }@inputs: {
        # packages.x86_64-linux.default = inputs.fenix.packages.x86_64-linux.default.toolchain;
        nixosConfigurations = {
            toaster = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/toaster/default.nix
                    ./nixos/configuration.nix
                ];
            };
        };
    };
}
