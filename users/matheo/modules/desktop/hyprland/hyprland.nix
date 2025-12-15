{ pkgs, ... }:
{
  xdg.configFile."hypr" = {
    source = ../../../dotfiles/hypr;
    recursive = true;
  };

  home.packages = with pkgs; [
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsysteminfo

    app2unit

    wl-clipboard
    cliphist

    inotify-tools
    libnotify

    nerd-fonts.jetbrains-mono

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
  ];
}
