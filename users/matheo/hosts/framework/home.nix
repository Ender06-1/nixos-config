{ ... }:
{
  imports = [
    ../../home-modules/shells/fish.nix

    ../../home-modules/clis

    ../../home-modules/desktop-environments/hyprland

    ../../home-modules/applications

    ../../home-modules/languages/flutter.nix

    ../../home-modules/todo.nix
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.stateVersion = "25.05";
}
