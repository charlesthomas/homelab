# intel-device-plugins-operator

combined with [intel-device-plugins-gpu](/intel-device-plugins-gpu/), enables hardware transcoding in [plex](/plex/)

## get the chart

```bash
helm repo add intel https://intel.github.io/helm-charts/
helm repo update
```

## get the stock values

```bash
helm show values intel/intel-device-plugins-operator > intel-device-plugins-operator/stock-values.yaml
```

## install the chart

```bash
helm upgrade --install device-plugin-operator intel/intel-device-plugins-operator \
--create-namespace --namespace intel \
--values intel-device-plugins-operator/values.yaml
```
