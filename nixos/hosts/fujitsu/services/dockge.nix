{ ... }:
let
  hostname = "dockge.tailb1bb3f.ts.net";
in
{
  services.caddy.virtualHosts.${hostname}.extraConfig = ''
    bind tailscale/dockge
    tailscale_auth
    reverse_proxy 127.0.0.1:8000
  '';

  users = {
    users."service-runner" = {
      isNormalUser = true;
      extraGroups = [ "storage" ];

      linger = true;
      autoSubUidGidRange = true;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPybOZB+lmPWgxHv5boGPtlMz6QQ8T881/Yzbk/M36z"
      ];
    };
  };
}
