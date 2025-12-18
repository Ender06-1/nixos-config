{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    fastfetch
    btop

    ffmpeg
    p7zip
    poppler
    ripgrep
    fzf
    fd
    resvg
    imagemagick

    discord
    google-chrome
    libreoffice-fresh
    evince
    file-roller
    loupe
    nautilus
    papers
    vlc

    zip
    unzip

    nil

    file

    gnumake
    bear

    nvtopPackages.intel

    python3

    devenv

    glow

    bitwarden-desktop

    wget

    inputs.pyback.packages.${stdenv.hostPlatform.system}.default
  ];

  xdg.mimeApps.defaultApplicationPackages = with pkgs; [
    loupe
    evince
    libreoffice-fresh
    file-roller
    papers
  ];
}
