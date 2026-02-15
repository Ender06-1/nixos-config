{ inputs, ... }:
{
  flake.modules.nixos.hyprland-laptop = {
    imports = [
      inputs.self.modules.nixos.hyprland
    ];

    services = {
      power-profiles-daemon.enable = true;
      thermald.enable = true;
    };
  };

  flake.modules.homeManager.hyprland-laptop =
    { ... }:
    {
      programs.caelestia = {
        settings = {
          bar.status.showBattery = false;
        };
      };
    };
}
