{ pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    ftb-app
  ];
}
