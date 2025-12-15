{ pkgs, ... }:
{
  programs.firefox.enable = true;

  xdg = {
    enable = true;
    mimeApps.defaultApplicationPackages = [ pkgs.firefox ];
  };
}
