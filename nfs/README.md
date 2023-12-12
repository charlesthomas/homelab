# nfs

nfs storage classes use [kubernetes-sigs/nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)

there are 2 storage classes, each with its own deployment of nfs-subdir-external-provisioner:

- nfs-k3s
  - nfs://nas01/volume1/k3s
- nfs-critical
  - nfs://nas01/volume1/crticial/k3s

## install nfs-common on the nodes

```bash
sudo apt-get install nfs-common -y
```

## installation

```bash
kubectl apply -k nfs/nfs-critical/
kubectl apply -k nfs/nfs-k3s/
```
