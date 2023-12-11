# grafana

## grafana secret

```bash
kubectl create namespace grafana
kubectl create -n grafana secret generic grafana && \
kubectl edit -n grafana secret grafana
```

insert:

```yaml
data:
    admin-user: <base64-encoded admin>
    admin-password: <base64-encoded password>
```

## influxdb secret

```bash
kc get -o yaml -n influxdb2 secret influxdb-auth | sed s/'namespace: influxdb2'/'namespace: grafana'/ | kc apply -f -
```

## get the chart

```bash
helm repo add grafana https://grafana.github.io/helm-charts && \
helm repo update
```

## generate dashboards

in an effort to make it easy to provision dashboards without going crazy trying to maintain
a giant configmap full of json blobs, i created `generate-dashboards.sh`.

it uses `yq` to dynamically generate a configmap of all the dashboards stored in `grafana/dashboards` so that each dashboard can be stored seaparately.

this requires generating a new CM every time you add a new dashboard:

```bash
grafana/generate-dashboards.sh && \
kubectl apply -f grafana/etc-dashboards.yaml
```

## stock values

```bash
helm show values grafana/grafana > grafana/stock-values.yaml
```

## installation

```bash
helm upgrade --install grafana grafana/grafana \
--create-namespace --namespace grafana \
--values grafana/values.yaml
```

## uninstall

```bash
helm uninstall --namespace grafana grafana
```
