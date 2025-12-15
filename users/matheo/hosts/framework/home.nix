{ ... }:
{
  imports = [
    ../../modules/shells/fish.nix

    ../../modules/desktop/hyprland
    ../../modules/desktop/hyprland/config/framework.nix
    ../../modules/programs

    ../../modules/todo.nix
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.stateVersion = "25.05";
}
