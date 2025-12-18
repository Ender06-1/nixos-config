{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.vlc ];
    };
  };
}
