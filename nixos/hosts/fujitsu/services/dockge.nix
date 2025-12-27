{ ... }:
{
  virtualisation.oci-containers.containers."dockge" = {
    autoStart = true;

    image = "louislam/dockge:1";

    ports = [
      "100.109.42.109:5001:5001"
    ];

    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "./data:/app/data"
      "/opt/stacks:/opt/stacks"
    ];

    environment = {
      DOCKGE_STACKS_DIR = "/opt/stacks";
      DOCKGE_ENABLE_CONSOLE = "true";
    };
  };
}
