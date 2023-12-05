# loki

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install --create-namespace --namespace loki loki grafana/loki --values 30-loki/values.yaml
```
