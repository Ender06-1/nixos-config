{ ... }:
{
  imports = [
    ./modules/shells/fish.nix
    ./modules/programs/cli

    ./modules/desktop/hyprland/msi.nix
    ./modules/programs/gui
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.stateVersion = "25.05";
}
