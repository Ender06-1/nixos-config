{ ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableBashIntegration = false;
  };

  xdg = {
    enable = true;
    configFile."starship.toml".source = ../../../dotfiles/starship.toml;
  };
}
