{ ... }:
{
  imports = [
  ];

  users.users.rumicorne = {
    isNormalUser = true;
  };

  home-manager.users.matheo = ../../../home/rumicorne/thinkpad.nix;
}
