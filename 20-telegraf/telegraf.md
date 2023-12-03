# telegraf

used to gather metrics and ship them to `influxdb2`

## installation


### cluster access

figuring out permissions was a giant pain with k3s

[this doc](https://github.com/influxdata/telegraf/blob/master/plugins/inputs/kube_inventory/README.md#quickstart-in-k3s) recommends copying the k3s token and cert files to a new location, but even then i couldn't get the permissions correct

instead, on each node i did this even though i'm sure it's a terrible idea:

```bash
sudo chmod 701 /var/lib/rancher/k3s/server
sudo chmod 701 /var/lib/rancher/k3s/server/tls
sudo chmod 604 /var/lib/rancher/k3s/server/token
sudo chmod 604 /var/lib/rancher/k3s/server/tls/client-admin.key
```

### influxdb access

in order send metrics to the [influxdb2](/docs/influxdb2.md) server, telegraf needs to auth.
i did this by `kubectl get`-ting the secret from the `influxdb2` namespace and `kubectl apply`-ing it to the `telegraf` namespace

i could figure out a one-liner for this, but it's temporary anyway until i get secrets management sorted out. instead i had to write the file to disk, so i could edit the namespace to change it from `influxdb2` to `telegraf` or else it would just re-apply the secret to the namespace it's already in

### the actual install

```bash
helm repo add influxdata https://helm.influxdata.com/ && \
helm upgrade --install --create-namespace --namespace telegraf telegraf influxdata/telegraf-ds --values 20-telegraf/values.yaml && \
kubectl apply -f 20-telegraf/rbac.yaml
```

the additional `kubectl apply` for rbac here is because i added permissions based on the `kube-inventory` [plugin docs](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/kube_inventory#kubernetes-permissions).

these docs slightly conflict with the RBAC setup by the helm chart, so i disabled creating rbac in `values.yaml` and the apply is doing a combo of both the one in the chart and the one in the docs
