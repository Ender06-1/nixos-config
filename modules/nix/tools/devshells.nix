{ inputs, ... }:
{
  flake-file.inputs.shells = {
    url = "path:./shells";
    flake = false;
  };

  perSystem = { pkgs, ... }:
    let
      shells = inputs.shells;
    in
    {
      devShells.default = import "${shells}/nix-flake.nix" { inherit pkgs; };
    };
}
