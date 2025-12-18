{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice-fresh
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.libreoffice-fresh ];
    };
  };
}
