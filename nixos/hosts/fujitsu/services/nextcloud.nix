{ ... }:
let
  hostname = "nextcloud.tailb1bb3f.ts.net";
in
{
  virtualisation.oci-containers.containers."nextcloud-aio-mastercontainer" = {
    autoStart = true;

    image = "ghcr.io/nextcloud-releases/all-in-one:latest";

    ports = [
      "100.109.42.109:8003:8080"
    ];

    environment = {
      APACHE_PORT = "11000";
      APACHE_IP_BINDING = "127.0.0.1";

      NEXTCLOUD_DATADIR = "/mnt/data/nextcloud/data";
    };

    volumes = [
      "nextcloud_aio_mastercontainer:/mnt/docker-aio-config"
      "/var/run/docker.sock:/var/run/docker.sock:ro"
    ];
  };

  services.caddy.virtualHosts."https://${hostname}".extraConfig = ''
    bind tailscale/nextcloud
    tailscale_auth
    reverse_proxy http://127.0.0.1:11000
  '';
}
