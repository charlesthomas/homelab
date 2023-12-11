# nfs

nsf storage classes use [kubernetes-sigs/nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)

the `nfs` chart sets that as a dependency, so installing the chart will install the provisioner,

although you may need to build the dependency first

## installation

### install nfs-common on the nodes

```bash
sudo apt-get install nfs-common -y
```
### install the chart

```bash
helm dependency build nfs --skip-refresh && \
helm upgrade --install nfs nfs/ \
--create-namespace --namespace nfs \
--values nfs/values.yaml
```

