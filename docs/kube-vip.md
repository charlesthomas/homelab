# kube-vip & kubectl config

using `kube-vip` in ARP mode to create a virtual IP that points to any active control-plane node in the cluster via one IP

## install kube-vip

install `kube-vip` as a daemonset on all control-plane nodes (all 4 nodes for now)


```bash
helm install kube-vip 0-kube-vip/ && \
ping 192.168.1.3
```

## pull kubectl config

once the .3 vip is returning pings, you can pull the `k3s` config for `kubectl` and configure it to connect through the .3 vip

```bash
scp k3s0:/etc/rancher/k3s/k3s.yaml ~/.kube/config
```

be sure to edit `~/.kube/config` and change the IP to the .3 vip
