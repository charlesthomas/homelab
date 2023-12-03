# promtail

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install --create-namespace --namespace promtail promtail grafana/promtail --values 20-promtail/values.yaml
```
