# k3s

# upgrade

for whatever reason, i couldn't get the `curl` install to work for upgrading nodes. instead, i downloaded the binary locally, then `scp`-ed it to each node and did the following:

```bash
kubectl drain k3s$n --ignore-daemonsets --delete-emptydir-data
ssh k3s$n # from here, commands run directly on the node over ssh
### begin running commands directly on node ###
sudo service k3s stop
/usr/local/bin/k3s-killall.sh
sudo cp /usr/local/bin/k3s /usr/local/bin/k3s-oldversion.bk
sudo mv k3s /usr/local/bin
sudo service k3s start
exit
### end running commands directly on node ###
kubectl uncordon k3s$n
```

# installation

## k3s0

```bash
curl -sfL https://get.k3s.io | sh -s - server \
--cluster-init \
--disable=traefik \
--disable=servicelb \
--tls-san=192.168.1.3,k3s.local \
--write-kubeconfig-mode=644 && \
sudo cat /var/lib/rancher/k3s/server/token
```

## remaining nodes

```bash
curl -sfL https://get.k3s.io | sh -s - server \
--cluster-init \
--disable=traefik \
--disable=servicelb \
--tls-san=192.168.1.3,k3s.local \
--write-kubeconfig-mode=644 \
--server https://192.168.1.10:6443 \
--token <TOKEN_FROM_K3S0>
```

# uninstalling k3s

```bash
/usr/local/bin/k3s-uninstall.sh && sudo reboot
```


