{ inputs, lib, ... }:
{
  flake.nixosConfigurations."framework" = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos."framework"
      { nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux"; }
    ];
  };

  flake-file.inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [ inputs.home-manager.flakeModules.home-manager ];
}
