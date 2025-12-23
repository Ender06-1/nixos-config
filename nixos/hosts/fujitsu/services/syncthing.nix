{ ... }:
{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "100.109.42.109:8001";
  };

  networking.firewall.allowedTCPPorts = [ 8001 ];
}
