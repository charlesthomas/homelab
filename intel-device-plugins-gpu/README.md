# intel-device-plugins-gpu

combined with [intel-device-plugins-operator](/intel-device-plugins-operator/), enables hardware transcoding in [plex](/plex/)

## get the chart

```bash
helm repo add intel https://intel.github.io/helm-charts/
helm repo update
```

## get the stock values

```bash
helm show values intel/intel-device-plugins-gpu > intel-device-plugins-gpu/stock-values.yaml
```

## install the chart

```bash
helm upgrade --install intel-device-plugins-gpu intel/intel-device-plugins-gpu \
--create-namespace --namespace intel \
--values intel-device-plugins-gpu/values.yaml
```
