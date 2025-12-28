{ ... }:
let
  container_name = "dockge";
  hostname = "dockge.tailb1bb3f.ts.net";
  stacks_path = "/var/lib/dockge/stacks";
in
{
  virtualisation.oci-containers.containers.${container_name} = {
    autoStart = true;

    image = "louislam/dockge:1";

    ports = [
      "127.0.0.1:8000:5001"
    ];

    volumes = [
      "/var/run/docker.sock:/var/run/docker.sock"
      "/var/lib/dockge/data:/app/data"
      "${stacks_path}:${stacks_path}"
    ];

    environment = {
      DOCKGE_STACKS_DIR = stacks_path;
    };
  };

  services.caddy.virtualHosts.${hostname}.extraConfig = ''
    bind tailscale/dockge
    tailscale_auth
    reverse_proxy 127.0.0.1:8000
  '';
}
