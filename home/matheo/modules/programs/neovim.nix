{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      gcc
      lua
      luarocks
      lua-language-server
      stylua

      nerd-fonts.fira-code
    ];
  };

  xdg = {
    enable = true;
    configFile = {
      "nvim" = {
        source = ../../dotfiles/nvim;
        recursive = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplicationPackages = [ pkgs.neovim ];
    };
  };
}
