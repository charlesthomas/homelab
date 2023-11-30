# longhorn

`longhorn` provides distributed block storage


## installation

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm upgrade --install --create-namespace --namespace longhorn longhorn longhorn/longhorn --version 1.5.3 --values 10-longhorn/values.yaml
```

### disable usage metrics

1. open UI
1. go to Settings -> General
1. uncheck Allow Collecting Longhorn Usage Metrics
1. click Save

there's [an open GitHub Issue](https://github.com/longhorn/longhorn/issues/7050) to add this to the chart

## uninstallation

longhorn blocks its own uninstallation, so you don't lose data

to do it anyway:

```bash
kubectl -n longhorn edit settings.longhorn.io deleting-confirmation-flag
```

