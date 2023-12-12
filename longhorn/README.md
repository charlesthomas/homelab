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
--values longhorn/values.yaml
```

## retention storage class

the helm chart only creates on storageclass, and i set it up with `RetentionPolicy: Delete`

```bash
kubectl apply -f longhorn/longhorn-retain.yaml
```

will create a storageclass named `longhorn-retain` with `RetentionPolicy: Retain`

## ingress

longhorn's chart requires putting the tls secret name in the ingress, which i don't want;
i want it to use the nginx-ingress-controller's default
so manually add the ingress like this, b/c it isn't in `values.yaml`:

```bash
kubectl apply -f longhorn/ingress.yaml
```

## recurring backup jobs

you manually created some recurring backup jobs, but they're CRDs, so if for some reason you need to re-apply them:

```bash
kubectl apply -f longhorn/backup-jobs.yaml
```

and if you add more:

```bash
kubectl get -o yaml -n longhorn recurringjobs > longhorn/backup-jobs.yaml
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
