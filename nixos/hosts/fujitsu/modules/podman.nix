{ pkgs, ... }:
{
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users."admin" = {
    extraGroups = [ "podman" ];
    linger = true;
    autoSubUidGidRange = true;
  };

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 53;

  systemd.user.services.podman-restart.wantedBy = [ "default.target" ];

  environment.systemPackages = with pkgs; [
    podman-compose
  ];
}
