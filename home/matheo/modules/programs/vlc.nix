{ pkgs, ... }:
{
  home.packages = [ pkgs.vlc ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.vlc ];
    };
  };
}
