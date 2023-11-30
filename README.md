# homelab

instructions, manifests, scripts, etc for my home lab running on k3s

services are prefixed with a number, indicating order of operations in the case of disaster recovery

eg 0-kube-vip should be the first service added to a clean install

they increment by tens for future-proofing
(what happens if i need to add a service that goes after the 10s but before the 20s? add a 15.)

- [hardware](/docs/hardware.md)
- [k3s](/docs/k3s.md)
- [networking](/docs/networking.md)
  - [kube-vip](/docs/kube-vip.md)
- [storage](/docs/storage.md)
  - [longhorn](/docs/longhorn.md)
  - [nfs](/docs/nfs.md)
- observability
  - [influxdb2](/docs/influxdb2.md)
