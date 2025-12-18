{ ... }:
{
  imports = [
    ../../modules/docker.nix
    ../../modules/steam.nix
    ../../modules/udisks2.nix
    ../../modules/gvfs.nix
    ../../modules/hyprland.nix
  ];

  users.users.matheo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "kvm"
      "adbusers"
      "libvirtd"
    ];
  };

  home-manager.users.matheo = ../../../home/matheo/msi.nix;
}
