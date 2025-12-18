{ pkgs, ... }:
{
  imports = [
    ./caelestia.nix
  ];

  xdg = {
    enable = true;
    configFile."hypr" = {
      source = ../../../dotfiles/hypr;
      recursive = true;
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsysteminfo

    app2unit
    jq

    wl-clipboard
    cliphist

    inotify-tools
    libnotify

    brightnessctl
    pavucontrol
    playerctl

    papirus-icon-theme

    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qt5compat

    nwg-look
    adw-gtk3

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
}
