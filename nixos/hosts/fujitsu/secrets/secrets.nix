let
  matheo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPybOZB+lmPWgxHv5boGPtlMz6QQ8T881/Yzbk/M36z";

  fujitsu = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK+tU/E/o+pwTUedRFoCBGwokd2hdvwXWGSW+Si1tQtu";
in
{
  "ts-authkey.age".publicKeys = [
    matheo
    fujitsu
  ];
  "pihole.age".publicKeys = [
    matheo
    fujitsu
  ];
}
