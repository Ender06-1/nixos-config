{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    inputs.home-manager.nixosModules.home-manager
  ];

  networking = {
    hostName = "thinkpad";
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

  console.keyMap = "fr";
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "fr_FR.UTF-8";
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

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };

  users.users.matheo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };
  home-manager.users.matheo = ./matheo.nix;

  users.users.rumicorne = {
    isNormalUser = true;
  };
  home-manager.users.rumicorne = ./rumicorne.nix;

  system.stateVersion = "25.11";
}
