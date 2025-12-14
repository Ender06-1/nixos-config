{ ... }:
{
  imports = [
    ../../modules/shells/fish.nix

    ../../modules/desktop/hyprland
    ../../modules/programs

    ../../modules/todo.nix
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.stateVersion = "25.05";
}
