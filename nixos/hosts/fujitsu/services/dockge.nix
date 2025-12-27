{ ... }:
let
  hostname = "dockge.tailb1bb3f.ts.net";
  stacks_path = "/var/lib/dockge/stacks";
in
{
  virtualisation.oci-containers.containers."dockge" = {
    autoStart = true;
    user = "admin:users";

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

  # systemd.tmpfiles.rules = [
  #   "d /var/lib/dockge/stacks 0755 admin users -"
  # ];

  services.caddy.virtualHosts.${hostname}.extraConfig = ''
    bind tailscale/dockge
    tailscale_auth
    reverse_proxy 127.0.0.1:8000
  '';
}
