{
  description = "NixOS Configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

  outputs = {
    self,
    nixpkgs,
	stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
	lib    = nixpkgs.lib;
  in {
    nixosConfigurations = {
      humam = lib.nixosSystem {
		inherit system;
        modules = [
			stylix.nixosModules.stylix
			./configuration.nix
		];
      };
    };
  };
}
