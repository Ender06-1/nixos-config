{ pkgs, ... }:
{
  home.packages = with pkgs; [
    file-roller
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.file-roller ];
    };
  };
}
