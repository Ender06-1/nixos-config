{ input, ... }:
{
  flake.nixosConfigurations = input.self.lib.mkNixos "x86_64-linux" "framework";
}
