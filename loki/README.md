# loki

```bash
helm repo add grafana https://grafana.github.io/helm-charts
```

```bash
helm upgrade --install loki grafana/loki \
--create-namespace --namespace loki \
--values loki/values.yaml
```
