{ inputs, pkgs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  home.username = "matheo";
  home.homeDirectory = "/home/matheo";

  home.packages = with pkgs; [
    fzf
    btop
    fastfetch
    wget
    file
    nerd-fonts.fira-code
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
    unzip
    zip
    bitwarden-desktop
    discord
    file-roller
    google-chrome
    libreoffice-fresh
    loupe
    jdk25_headless
    prismlauncher
    ftb-app
    nautilus
    papers
    vlc
    hyprpaper
    hyprpicker
    hyprpolkitagent
    hyprsysteminfo
    app2unit
    jq
    wl-clipboard
    cliphist
    inotify-tools
    libnotify
    brightnessctl
    pavucontrol
    playerctl
    papirus-icon-theme
    kdePackages.qt6ct
    kdePackages.qtsvg
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qt5compat
    nwg-look
    adw-gtk3
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
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

  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    cli.enable = true;
    settings = {
      general.apps = {
        terminal = [ "kitty" ];
        audio = [ "pavucontrol" ];
        playback = [ "mpv" ];
        explorer = [ "nautilus" ];
      };
      paths.sessionGif = "";
      services = {
        useFahrenheit = false;
        useTwelveHourClock = false;
      };

      bar.status.showBattery = false;
    };
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;

    hyprcursor.enable = true;
  };

  programs.bat.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

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
        name = "Ender";
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

  fonts.fontconfig.enable = true;

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

  programs.firefox.enable = true;

  programs.kitty = {
    enable = true;
    themeFile = "OneDark-Pro";
    font.name = "FiraCode Nerd Font";
  };

  programs.obs-studio.enable = true;

  programs.vscode.enable = true;

  programs.distrobox.enable = true;

  programs.zoxide.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    configFile = {
      "fish/conf.d" = {
        source = ./dotfiles/fish/conf.d;
        recursive = true;
      };
      "fish/functions" = {
        source = ./dotfiles/fish/functions;
        recursive = true;
      };
      "starship.toml".source = ./dotfiles/starship.toml;
      "hypr" = {
        source = ./dotfiles/hypr;
        recursive = true;
      };
      "nvim" = {
        source = ./dotfiles/nvim;
        recursive = true;
      };
    };
    mimeApps = {
      enable = true;
      defaultApplicationPackages = with pkgs; [
        neovim
        firefox
        file-roller
        libreoffice-fresh
        vlc
        papers
        loupe
      ];
    };
  };

  home.stateVersion = "25.05";
}
