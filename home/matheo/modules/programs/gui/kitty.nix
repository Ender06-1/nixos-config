{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    themeFile = "OneDark-Pro";
    font.name = "FiraCode Nerd Font";
  };

  home.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
