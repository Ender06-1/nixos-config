{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./services/ssh.nix
    ./services/tailscale.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "fujitsu";

  networking = {
    interfaces.enp2s0 = {
      ipv4.addresses = [
        {
          address = "192.168.0.2";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.0.1";
      interface = "enp2s0";
    };
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  nix.settings.trusted-users = [
    "admin"
  ];

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPybOZB+lmPWgxHv5boGPtlMz6QQ8T881/Yzbk/M36z"
    ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    btop
  ];

  system.stateVersion = "25.11";
}
