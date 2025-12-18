{ pkgs, ... }:
{
  programs.yazi.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    file

    nerd-fonts.fira-code
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
    wl-clipboard
  ];
}
