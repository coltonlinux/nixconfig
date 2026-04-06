{
  description = "My NixOS config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix/release-25.11";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./configuration.nix

        # Enable Catppuccin for NixOS
        catppuccin.nixosModules.catppuccin

        # Enable Home Manager
        home-manager.nixosModules.home-manager

        # Home Manager user config
        {
          home-manager.users.colton = {
            imports = [
              ./home.nix

              # Enable Catppuccin for Home Manager
              catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
