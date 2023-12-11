# reloader

reload deployments when their configmaps / secrets change

## the annotation:

```yaml
kind: Deployment
metadata:
    annotations:
        reloader.stakater.com/auto: "true"
```

current uses:

- [grafana dashboards](/grafana/)
- [home-assistant automations](/home-assistant/)

## get the chart

```bash
helm repo add stakater https://stakater.github.io/stakater-charts
helm repo update
```

## get the stock values

```bash
helm show values stakater/reloader > reloader/stock-values.yaml
```

## install

```bash
helm upgrade --install reloader stakater/reloader \
--create-namespace --namespace reloader \
--values reloader/values.yaml
```
