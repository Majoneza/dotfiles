{
    description = "This is a flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager?ref=release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nilpkg = {
            url = "github:oxalica/nil?ref=2024-08-06";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-flatpak = {
            url = "github:gmodena/nix-flatpak?ref=v0.6.0";
        };
        sops-nix = {
            url = "github:Mic92/sops-nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-flatpak, sops-nix, ... }@inputs:
        let
            system = "x86_64-linux";
            devname = "laptop";
            username = "matej";
            extraArgs = {
                inherit inputs;
                inherit devname;
                inherit username;
                sysModules = ./modules;
                homeModules = ./home/modules;
                myLib = import ./lib { inherit (nixpkgs) lib; };
                pkgs-unstable = import nixpkgs-unstable {
                    inherit system;
                };
            };
        in
        {
            nixosConfigurations."${devname}" = nixpkgs.lib.nixosSystem {
                inherit system;
                modules = [
                    ./hardware-configuration.nix
                    ./hosts/common.nix
                    ./hosts/${devname}
                    sops-nix.nixosModules.sops
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users."${username}".imports = [
                            nix-flatpak.homeManagerModules.nix-flatpak
                            ./home/users/common.nix
                            ./home/users/${username}
                        ];
                        home-manager.extraSpecialArgs = extraArgs;
                    }
                ];
                specialArgs = extraArgs;
            };
        };
}
