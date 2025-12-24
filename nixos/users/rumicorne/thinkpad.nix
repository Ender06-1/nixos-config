{ ... }:
{
  imports = [
  ];

  users.users.rumicorne = {
    isNormalUser = true;
  };

  home-manager.users.rumicorne = ../../../home/rumicorne/thinkpad.nix;
}
