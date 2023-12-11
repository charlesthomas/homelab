# promtail

```bash
helm repo add grafana https://grafana.github.io/helm-charts
```

```bash
helm upgrade --install promtail grafana/promtail \
--create-namespace --namespace promtail \
--values promtail/values.yaml
```
