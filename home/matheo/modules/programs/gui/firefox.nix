{ pkgs, ... }:
{
  programs.firefox.enable = true;

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.firefox ];
    };
  };
}
