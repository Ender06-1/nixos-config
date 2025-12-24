{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad

    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-gpu-intel

    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd

    ./hardware-configuration.nix

    ../../modules/home-manager.nix
    ../../modules/region.nix
    ../../modules/nix.nix
    ../../modules/bluetooth.nix
    ../../modules/networkmanager.nix
    ../../modules/ssh.nix
    ../../modules/pipewire.nix
    ../../modules/power-profiles-daemon.nix
    ../../modules/thermald.nix

    ../../modules/kde.nix

    ../../users/matheo/thinkpad.nix
    ../../users/rumicorne/thinkpad.nix
  ];

  networking.hostName = "thinkpad";

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
  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    supportedLocales = [ "all" ];
  };

  hardware = {
    graphics.enable = true;
    intel-gpu-tools.enable = true;
  };

  system.stateVersion = "25.11";
}
