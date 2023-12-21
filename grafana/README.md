# grafana

## grafana && influxdb secrets

```bash
kubectl create namespace grafana
kubectl apply -f grafana/external-secrets.yaml
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
