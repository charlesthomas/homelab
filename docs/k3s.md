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

first, scp `k3s$host.yaml` & `token` to host

```bash
curl -sfL https://get.k3s.io | sh -s - server --config /home/k3s/$(hostname -s)
```

# uninstalling k3s

```bash
/usr/local/bin/k3s-uninstall.sh && sudo reboot
```


