{ pkgs, ... }:

pkgs.mkShell {
  name = "nix-flake";

  packages = with pkgs; [
    nil
  ];
}
