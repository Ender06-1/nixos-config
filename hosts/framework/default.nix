{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-13th-gen-intel
    inputs.home-manager.nixosModules.home-manager

  ];

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
    extraSpecialArgs = { inherit inputs; };
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

  home-manager.users.matheo = ./home.nix;

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
}
