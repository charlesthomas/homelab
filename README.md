# homelab

instructions, manifests, scripts, etc for my home lab running on k3s

- [hardware](/docs/hardware.md)
- [k3s](/docs/k3s.md)
- [networking](/docs/networking.md)
- [storage](/docs/storage.md)
- disaster recovery
  - [Was the raft log corrupted, truncated, or lost?](/docs/dr/raft.md)

## services

- k8s fanciness
  - [descheduler](/descheduler/)
  - [node-feature-discovery](/node-feature-discovery)
  - [reloader](/reloader/)
- networking & routing
  - [external-dns](/external-dns/)
  - [kube-vip](/kube-vip/)
  - [metallb](/metallb/)
  - [pihole](/pihole/)
- storage
  - [longhorn](/longhorn/)
  - [nfs](/nfs/)
- ssl & reverse proxy-ing
  - [cert-manager](/cert-manager/)
  - nginx
    - [crt.house internal](/nginx-crt-house/)
    - [crt.house external](/nginx-crt-house-external/)
- observability
  - [grafana](/grafana/)
  - [influxdb2](/influxdb2/)
  - [loki](/loki/)
  - [promtail](/promtail/)
  - [telegraf](/telegraf/)
- home automation
  - [home-assistant](/home-assistant/)
  - [mosquitto](/mosquitto/)
  - [zigbee2mqtt](/zigbee2mqtt/)
