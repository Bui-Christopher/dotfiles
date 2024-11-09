{
    description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Home Manager
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # NixVim
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # NOTE:
        # Fenix is an alternative for using rustc and cargo from nixpkgs for nightly
        # It replaces rustup, but I'd like to be in favor of development shells instead
        # Fenix
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
