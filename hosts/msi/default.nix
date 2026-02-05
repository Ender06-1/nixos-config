{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.home-manager.nixosModules.home-manager

  ];

  networking = {
    hostName = "msi";
    networkmanager.enable = true;
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/13ddf8d8-def6-467f-b487-1958633cf951";
    fsType = "ext4";
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

  hardware.graphics.enable = true;

  services.tailscale.enable = true;
  environment.systemPackages = [
    inputs.agenix.packages."x86_64-linux".default
  ];

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
