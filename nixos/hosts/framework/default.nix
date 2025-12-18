{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13th-gen-intel

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

    ../../users/matheo/framework.nix
  ];

  networking.hostName = "framework";

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

  system.stateVersion = "25.05";
}
