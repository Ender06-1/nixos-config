{ pkgs, ... }:
{
  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.packages = with pkgs; [
    fzf
    nerd-fonts.fira-code
    google-chrome
    unzip
    zip
    file
    ffmpeg
    p7zip
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick
    wl-clipboard
    wget
    fastfetch
    btop
  ];

  programs.fish = {
    enable = true;
    generateCompletions = false;
    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      nvimf = "nvim (fzf)";
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.starship = {
    enable = true;
    enableTransience = true;
    enableBashIntegration = false;
  };

  programs.bat.enable = true;

  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    extraOptions = [
      "--hyperlink"
      "--group-directories-first"
      "--smart-group"
      "--header"
    ];
  };

  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Mathéba";
        email = "ndxendernight@gmail.com";
      };
    };
  };

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

  programs.tmux = {
    enable = true;

    clock24 = true;
    mouse = true;
    resizeAmount = 10;
    shortcut = "s";
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      onedark-theme
    ];
  };

  programs.yazi.enable = true;

  programs.zoxide.enable = true;

  programs.firefox.enable = true;

  programs.kitty = {
    enable = true;
    themeFile = "OneDark-Pro";
    font.name = "FiraCode Nerd Font";
  };

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    configFile = {
      "nvim" = {
        source = ./dotfiles/nvim;
        recursive = true;
      };
      "fish/conf.d" = {
        source = ../../dotfiles/fish/conf.d;
        recursive = true;
      };
      "fish/functions" = {
        source = ../../dotfiles/fish/functions;
        recursive = true;
      };
      "starship.toml".source = ../../dotfiles/starship.toml;
    };
    mimeApps = {
      enable = true;
      defaultApplicationPackages = with pkgs; [
        neovim
        firefox
      ];
    };
  };

  home.stateVersion = "25.11";
}
