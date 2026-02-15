{ inputs, ... }:
{
  flake.nixosConfigurations."msi" = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos."msi"
    ];
  };

  flake-file.inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
    };
  };
}
