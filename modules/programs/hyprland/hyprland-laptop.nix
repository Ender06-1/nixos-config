{ inputs, ... }:
{
  flake.modules.nixos.hyprland-laptop = {
    imports = with inputs; [
      self.modules.nixos.hyprland
    ];

    home-manager.sharedModules = with inputs; [
      self.modules.homeManager.hyprland-laptop
    ];

    services = {
      power-profiles-daemon.enable = true;
      thermald.enable = true;
    };
  };

  flake.modules.homeManager.hyprland-laptop =
    { lib, ... }:
    {
      programs.caelestia = {
        settings = {
          bar.status.showBattery = lib.mkForce true;
        };
      };
    };
}
