# nfs

nsf storage classes use [kubernetes-sigs/nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)

the `10-nfs` chart sets that as a dependency, so installing the chart will install the provisioner,

although you may need to build the dependency first

## installation

```bash
helm dependency build 10-nfs --skip-refresh && \
helm upgrade --install --create-namespace --namespace nfs nfs 10-nfs/ --values 10-nfs/values.yaml
```

