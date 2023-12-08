# longhorn

`longhorn` provides distributed block storage

## get the chart

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
```

## installation

```bash
helm upgrade --install longhorn longhorn/longhorn \
--create-namespace --namespace longhorn \
--version 1.5.3 \
--values 10-longhorn/values.yaml
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

## recurring backup jobs

you manually created some recurring backup jobs, but they're CRDs, so if for some reason you need to re-apply them:

```bash
kubectl apply -f 10-longhorn/backup-jobs.yaml
```

and if you add more:

```bash
kubectl get -o yaml -n longhorn recurringjobs > 10-longhorn/backup-jobs.yaml
```
