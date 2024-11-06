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
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {

        nixosConfigurations = {
            toaster = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/toaster/default.nix
                    ./nixos/configuration.nix
                ];
            };
            # oven = nixpkgs.lib.nixosSystem {
            #     system = "x86_64-linux";
            #     specialArgs = { inherit inputs; };
            #     modules = [
            #         ./nixos/configuration.nix
            #         ./home.nix
            #     ];
            # };
        };
    };
}
