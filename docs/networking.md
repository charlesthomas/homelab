# networking

# DHCP

DHCP is handled by the EdgeMax

The default pool is 192.168.1.100 to 192.168.1.250

# Static IPs

- .1 router
  - manual
- .3 k3s kube-vip control-plane IP
  - manual
- .8 pihole (in cluster)
- .9 pihole (external; raspberry pi 2)
- .10 to .19 reserved for k3s nodes
  - static DHCP
- .20 to .29 reserved for storage (NAS)
  - static DHCP
- .40 to .99
  - [metallb pool](/0-metallb/metallb.md)
- .251 to .254 reserved for APs
  - static DHCP

# DNS

DNS is handled by 2 piholes. 1 container running in the cluster,
and a backup raspberry pi 2 running external to the cluster physically connected to the router
(not through additional switches / patch panels / etc)

[external-dns](/0-external-dns/external-dns.md) is running in the cluster and auto-updates the pihole
based on what happens with services in the cluster.
most records will be `CNAME`s pointing at [traefik](/20-traefik/traefik.md)
