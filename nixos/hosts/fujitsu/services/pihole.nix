{ config, ... }:
let
  hostname = "pihole.tailb1bb3f.ts.net";
in
{
  virtualisation.oci-containers.containers.pihole = {
    autoStart = true;

    image = "pihole/pihole:2025.11.1";

    inherit hostname;
    ports = [
      "53:53/tcp"
      "53:53/udp"
      "127.0.0.1:8000:80/tcp"
    ];

    environment = {
      TZ = "Europe/Paris";
    };
    environmentFiles = [
      config.age.secrets.pihole.path
    ];

    volumes = [
      "/var/lib/pihole:/etc/pihole"
    ];
  };

  services.caddy.virtualHosts."https://${hostname}".extraConfig = ''
    bind tailscale/pihole
    tailscale_auth
    reverse_proxy 127.0.0.1:8000
  '';
}
