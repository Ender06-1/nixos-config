{ pkgs, ... }:
{
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    google-chrome

    prismlauncher
    ftb-app
  ];

  home.username = "rumicorne";
  home.homeDirectory = "/home/rumicorne";

  home.stateVersion = "25.11";
}
