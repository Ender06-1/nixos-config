{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../../modules/home-manager.nix
    ../../modules/region.nix
    ../../modules/nix.nix
    ../../modules/bluetooth.nix
    ../../modules/networkmanager.nix
    ../../modules/ssh.nix
    ../../modules/pipewire.nix

    ../../users/matheo/msi.nix
  ];

  networking.hostName = "msi";

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

  system.stateVersion = "25.05";
}
