{
	description = "first flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

	};
	outputs = { self, nixpkgs, ... }@inputs: 
		let
			#lib = nixpkgs.lib;
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};

			#config = {};
			#nixvim' = nixvim.legacyPackages.${system};
			#nvim = nixvim'.makeNixvim config;
		in {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				inherit system;
				#modules = [ ./configuration.nix ];
				specialArgs = {inherit inputs;};
				modules = [
					./configuration.nix
                    inputs.home-manager.nixosModules.default
                    #inputs.nixvim.homeManagerModules.nixvim
				];
			};
		};
	};
}
