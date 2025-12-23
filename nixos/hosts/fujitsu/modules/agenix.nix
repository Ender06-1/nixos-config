{ ... }:
{
  age.secrets = {
    caddy.file = ../secrets/caddy.age;
    pihole.file = ../secrets/pihole.age;
  };
}
