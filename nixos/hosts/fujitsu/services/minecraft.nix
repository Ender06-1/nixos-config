{ ... }:
{
  virtualisation.oci-containers.containers."minecraft-1.21.11" = {
    autoStart = false;

    image = "itzg/minecraft-server";

    ports = [
      "192.168.0.2:25565:25565"
    ];

    environment = {
      EULA = "TRUE";
    };
  };
}
