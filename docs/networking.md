# networking

# DHCP

DHCP is handled by the EdgeMax

The default pool is 192.168.1.100 to 192.168.1.250

# Static IPs
- .1 router
  - manual
- .3 k3s kube-vip control-plane IP
  - manual
- .10 to .19 reserved for k3s nodes
  - static DHCP
- .20 to .29 reserved for storage (NAS)
  - static DHCP
- .251 to .254 reserved for APs
  - static DHCP
