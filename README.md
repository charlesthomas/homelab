# homelab

instructions, manifests, scripts, etc for my home lab running on k3s

services are prefixed with a number, indicating order of operations in the case of disaster recovery

eg 0-kube-vip should be the first service added to a clean install

they increment by tens for future-proofing
(what happens if i need to add a service that goes after the 10s but before the 20s? add a 15.)

- [hardware](/docs/hardware.md)
- [k3s](/docs/k3s.md)
- [networking](/docs/networking.md)
- [storage](/docs/storage.md)
- disaster recovery
  - [Was the raft log corrupted, truncated, or lost?](/docs/dr/raft.md)

## services

### 0 networking & routing

- [external-dns](/0-external-dns/external-dns.md)
- [kube-vip](/0-kube-vip/kube-vip.md)
- [metallb](/0-metallb/metallb.md)
- [pihole](/0-pihole/pihole.md)

### 10 storage

- [longhorn](/10-longhorn/longhorn.md)
- [nfs](/10-nfs/nfs.md)

### 20 ssl & reverse proxyin-ing

- [cert-manager](/20-cert-manager/cert-manager.md)
- nginx
  - [crt.house internal](/20-nginx-crt.house/nginx.md)
  - [crt.house external](/20-nginx-crt-house-external/nginx.md)

### 30 observability

- [grafana](/30-grafana/grafana.md)
- [influxdb2](/30-influxdb2/influxdb2.md)
- [loki](/30-loki/loki.md)
- [promtail](/30-promtail/promtail.md)
- [telegraf](/30-telegraf/telegraf.md)
