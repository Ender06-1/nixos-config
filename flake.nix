{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "flake-config";
        packages = with pkgs; [
          nil
        ];
      };

      nixosConfigurations = {
        framework = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/hosts/framework ];
        };

        msi = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/hosts/msi ];
        };

        thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/hosts/thinkpad ];
        };

        fujitsu = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./nixos/hosts/fujitsu ];
        };
      };

      packages.${system} = { };

      templates = {
        c = {
          path = ./templates/c;
          description = "C project template";
        };
      };
    };
}
