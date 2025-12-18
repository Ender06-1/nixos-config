{ pkgs, ... }:
{
  home.packages = with pkgs; [
    loupe
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.loupe ];
    };
  };
}
