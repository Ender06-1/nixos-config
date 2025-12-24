{ ... }:
{
  imports = [
  ];

  users.users.matheo = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };

  home-manager.users.matheo = ../../../home/matheo/thinkpad.nix;
}
