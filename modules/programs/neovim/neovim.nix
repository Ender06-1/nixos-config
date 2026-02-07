{
  flake.modules.homeManager.neovim =
    { pkgs, ... }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraPackages = with pkgs; [
          curl
          git

          gcc
          lua
          luarocks
          lua-language-server
          stylua

          ripgrep
          fd
          wl-clipboard

          fzf
        ];
      };

      xdg = {
        enable = true;
        configFile = {
          "nvim" = {
            source = ./config/nvim;
            recursive = true;
          };
        };
        mimeApps = {
          enable = true;
          defaultApplicationPackages = [ pkgs.neovim ];
        };
      };
    };
}
