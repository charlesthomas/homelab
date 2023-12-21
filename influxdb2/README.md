# influxdb2

## creating influxdb-auth secret

```bash
kubectl apply -f influxdb2/external-secrets.yaml
```

## get the chart

```bash
helm repo add influxdata https://helm.influxdata.com/
helm repo update
```

## installation

```bash
helm upgrade --install influxdb2 influxdata/influxdb2 \
--create-namespace --namespace influxdb2 \
--values influxdb2/values.yaml
```

## uninstallation

```bash
helm uninstall --namespace influxdb2 influxdb2
```
