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

## installation

```bash
helm repo add grafana https://grafana.github.io/helm-charts && \
helm repo update
helm upgrade --install --create-namespace --namespace grafana grafana/grafana --values 20-grafana/values.yaml
```
