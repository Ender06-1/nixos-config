{
  flake.modules.homeManager.browser = { pkgs, ... }: {
    programs.firefox.enable = true;

    home.packages = with pkgs; [
      google-chrome
    ];

    xdg = {
      enable = true;
      mimeApps = {
        enable = true;
        defaultApplicationPackages = [ pkgs.firefox ];
      };
    };
  };
}
