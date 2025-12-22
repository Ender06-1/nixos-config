{ ... }:
{
  virtualisation = {
    containers.enable = true;
    oci-containers.backend = "docker";

    docker.enable = true;
  };

  users.users.admin.extraGroups = [ "docker" ];
}
