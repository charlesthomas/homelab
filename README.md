# homelab

instructions, manifests, scripts, etc for my home lab running on k3s

# hardware

there are 4 Dell OptiPlex 3050 nodes running Intel Core i5s with 256gb SSDs and 8gb RAM

they're all running an Ubuntu 22.04 OS minimal server install

# installing k3s

## k3s0

```bash
curl -sfL https://get.k3s.io | sh -s - server \
--cluster-init \
--disable=traefik \
--tls-san=192.168.1.3,k3s.local \
--write-kubeconfig-mode=644 && \
sudo cat /var/lib/rancher/k3s/server/token
```

## remaining nodes

```bash
curl -sfL https://get.k3s.io | sh -s - server \
--cluster-init \
--disable=traefik \
--tls-san=192.168.1.3,k3s.local \
--write-kubeconfig-mode=644 \
--server https://192.168.1.10:6443 \
--token <TOKEN_FROM_K3S0>
```

## uninstalling k3s

```bash
/usr/local/bin/k3s-uninstall.sh && sudo reboot
```
