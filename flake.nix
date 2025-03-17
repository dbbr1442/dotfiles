{
	description = "first flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};
	outputs = { self, nixpkgs, home-manager, ... }@inputs: 
		let
			#lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in {
        formatter.system = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
		nixosConfigurations = {
			internal-nix = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = {inherit inputs;};
				modules = [
					#./configuration.nix no longer used
                    ./modules/nixos/nixos-connector.nix
                    #inputs.home-manager.nixosModules.default # imma be completely honest i have no idea what this does but im to scared to remove it
                    #./modules/hm/hm-connector.nix
				];         
			};
		};
        homeConfigurations = {
            "lucy" = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs { inherit system; };
                modules = [ ./modules/hm/hm-connector.nix ];
            };
        };
	};
}
