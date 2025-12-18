{ inputs, ... }:
{
  home.packages = [
    inputs.pyback.packages."x86_64-linux".default
  ];
}
