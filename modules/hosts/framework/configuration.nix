{ inputs, ... }:
{
  flake.modules.nixos.framework =
    {
      lib,
      config,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = with inputs; [
        (modulesPath + "/installer/scan/not-detected.nix")

        nixos-hardware.nixosModules.framework-13th-gen-intel
        home-manager.nixosModules.home-manager
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-intel" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/87f36fab-3d52-434f-af4c-ed9f30569981";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/E6FF-1223";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-uuid/f1b2f53b-bb38-4073-b750-6fa555de0c64"; }
      ];

      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

      networking = {
        hostName = "framework";
        networkmanager.enable = true;
      };

      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };

        kernelPackages = pkgs.linuxPackages_zen;

        tmp.cleanOnBoot = true;
      };

      console.keyMap = "us";

      services.logind.settings.Login = {
        HandlePowerKey = "suspend";
      };

      hardware = {
        graphics.enable = true;
        intel-gpu-tools.enable = true;
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
      };

      time.timeZone = "Europe/Paris";
      i18n.defaultLocale = "en_US.UTF-8";

      nix = {
        settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
        gc = {
          automatic = true;
          dates = "23:00";
        };
      };
      nixpkgs.config.allowUnfree = true;

      hardware.bluetooth = {
        enable = true;
        settings = {
          General = {
            Expermental = true;
          };
        };
      };

      programs.ssh = {
        startAgent = true;
        extraConfig = ''
          AddKeysToAgent yes
        '';
      };

      services.pipewire = {
        enable = true;
        pulse.enable = true;
      };

      services = {
        power-profiles-daemon.enable = true;
        thermald.enable = true;
      };

      services.flatpak.enable = true;

      users.users.matheo = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "docker"
          "kvm"
          "libvirtd"
        ];
      };

      home-manager.users.matheo =
        { pkgs, ... }:
        {
          imports = with inputs.self.modules.homeManager; [
            inputs.caelestia-shell.homeManagerModules.default

            browser
            neovim
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
            zoxide
            resvg
            imagemagick
            wl-clipboard
            unzip
            zip
            bitwarden-desktop
            discord
            file-roller
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
            };
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
                name = "Mathéba";
                email = "ndxendernight@gmail.com";
              };
            };
          };

          programs.tmux = {
            enable = true;

            clock24 = true;
            mouse = true;
            resizeAmount = 10;
            shortcut = "s";
            keyMode = "vi";
            escapeTime = 300;
            focusEvents = true;
            terminal = "tmux-256color";

            plugins = with pkgs.tmuxPlugins; [
              onedark-theme
            ];
          };

          programs.yazi.enable = true;

          programs.kitty = {
            enable = true;
            themeFile = "OneDark-Pro";
            font.name = "FiraCode Nerd Font";
          };

          programs.obs-studio.enable = true;

          programs.vscode.enable = true;

          programs.distrobox.enable = true;

          programs.zoxide.enable = true;

          home.pointerCursor = {
            enable = true;
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
            size = 24;

            hyprcursor.enable = true;
          };

          fonts.fontconfig.enable = true;

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
            };
            mimeApps = {
              enable = true;
              defaultApplicationPackages = with pkgs; [
                file-roller
                libreoffice-fresh
                vlc
                papers
                loupe
              ];
            };
          };

          home.stateVersion = "25.05";
        };

      virtualisation.docker = {
        enable = true;
        enableOnBoot = false;
      };

      programs.steam.enable = true;

      services = {
        udisks2.enable = true;
        gvfs.enable = true;
      };

      programs.hyprland.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
      services.displayManager.ly.enable = true;

      system.stateVersion = "25.05";
    };
}
