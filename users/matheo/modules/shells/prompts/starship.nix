{ ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;
    enableBashIntegration = false;
  };

  xdg.configFile."starship.toml".source = ../../../dotfiles/starship.toml;
}
