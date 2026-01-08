{
  description = "da cademunz flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    awesome-flake.url = "github:Souheab/awesomewm-git-nix-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
  }; 

  outputs = { self, nixpkgs, awesome-flake, home-manager, ... }@inputs: {
    nixosConfigurations.cademunz = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
         ./configuration.nix
         ({ pkgs, ... }: {
	   nixpkgs.overlays = [ awesome-flake.overlays.default ];

	   services.xserver = {
	     enable = true;
	     windowManager.awesome = {
	       enable = true;
	       package = pkgs.awesome-git;
	     };
	   };
	 })
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;

           home-manager.users.tarrey = import ./home.nix;
         }
      ];
    };
  };
}
