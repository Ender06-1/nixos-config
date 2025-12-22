{ ... }:
{
  virtualisation.oci-containers.containers.pihole = {
    autoStart = true;

    image = "pihole/pihole:2025.11.1";

    ports = [
      "53:53/tcp"
      "53:53/udp"
      "8080:80/tcp"
      "4443:443/tcp"
    ];

    environment = {
      TZ = "Europe/Paris";
    };

    volumes = [
      "/var/lib/pihole:/etc/pihole"
    ];
  };
}
