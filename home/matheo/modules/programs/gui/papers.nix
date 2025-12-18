{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papers
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.papers ];
    };
  };
}
